require 'rexml/document'

module Contract
  CONST_FIELDS = {'DirectorName' => 'Name of Director', 'FAPES_Account' => 'Account Information'}
  CONTRACTS_URL='/contracts'; CONTRACTS_DIR = Rails.public_path+CONTRACTS_URL
  ATTACHMENTS_DIR = "#{CONTRACTS_DIR}/attachments/"
  OUTPUT_DIR = "#{CONTRACTS_DIR}/generated/";  TEMPLATES_DIR = "#{CONTRACTS_DIR}/templates/"
  class << self
    # Save the template file at public/contracts/templates/scholarship.odt, then call:
    # Contract::generate('scholarship', {'student_name' => 'Rodrigo Rosenfeld'}, 'scholarships/1')
    # public/contracts/generated/scholarships/1.pdf will be created. Output is PDF link address.
    def generate (template_file, fields, output_file, options={})
      fields.merge!(CONST_FIELDS)
      template_file = TEMPLATES_DIR+template_file+'.odt'
      output_file.gsub! /[^\\\/\w\.\-]/, '_' # replaces non-alphanumerics to underscore. Security is responsability from calling method.
      pdf_output_filename = OUTPUT_DIR+output_file+'.pdf'
      pdf_output_filename_temp = options[:attachment] ? OUTPUT_DIR+output_file+'_without_attachment.pdf' :  pdf_output_filename
      output_file = OUTPUT_DIR+output_file+'.odt'
      output_dir = File.dirname(output_file); FileUtils.mkdir_p(output_dir)
      Kernel.system "unzip -o #{template_file} content.xml -d #{output_dir}" or return nil
      content_file = "#{File.readlines("#{output_dir}/content.xml")}"
      # before replacing expressions, generate table templates
      options[:tables].each {|t| content_file=generate_table(content_file,
        t[:table_name], t[:line], t[:fields])} if options[:tables]
      replace_expressions(content_file, fields)
      File.open("#{output_dir}/content.xml", 'w') { |f| f.write content_file }
      FileUtils.cp_r template_file, output_file
      #pdf-converter is a script, that currently uses PyODConverter (DEFAULT_OPENOFFICE_PORT=3003):
      #/opt/openoffice.org3/program/python /usr/local/bin/DocumentConverter.py $@
      Kernel.system("zip -j #{output_file} #{output_dir}/content.xml; pdf-converter #{output_file} #{pdf_output_filename_temp}") or return nil
      return merge_pdf(pdf_output_filename_temp, ATTACHMENTS_DIR + options[:attachment], pdf_output_filename) if options[:attachment]
      pdf_output_filename.sub /\Apublic/, ''
    end

    def replace_expressions(str, fields)
      # The pattern "#{student_name#U}" will be replaced by 'RODRIGO ROSENFELD'
      str.gsub!(/#\{(.*?)(#(.))?\}/) do
        result = (fields[$1] or '')
        case $3
          when 'U'; result.mb_chars.upcase.to_s
          when 'd'; result.mb_chars.downcase.to_s
          when 'C'; result.mb_chars.capitalize.to_s
	  # lots of other formatters here for writing number at full length, as currency, etc.
          else; result # doesn't change
        end
      end
    end

    # this generates dynamic tables into ODF Templates. It is necessary to define a name for the table in OpenOffice. 'line' starts at 1.
    # generate_table(content_string, 'Items', 2, [{'n' => 1, 'item' => 'Desktop computer'}, {'n' => 2, 'item' => 'Laser printer'}])
    def generate_table(content_xml, table_name, line, fields)
      document = REXML::Document.new(content_xml)
      template_line = document.root.elements["//table:table[@table:name='#{table_name}']/table:table-row[#{line}]"].to_s
      document.to_s.sub(template_line, fields.collect {|f| replace_expressions(template_line.dup, f)}.join)
    end

    # returns url to merged file or nil if it couldn't be generated
    def merge_pdf(contract, attachment, output)
      [contract, attachment].each {|f| return nil unless File.exist?(f)}
      Kernel.system("pdftk #{contract} #{attachment} cat output #{output}") or return nil
      output.sub(Rails.public_path, '')
    end
  end
end