require 'test_helper'
class ContractTest < ActiveSupport::TestCase
  # This test is not definitive, since it doesn't test the generated pdf content. But chances are good to be correct if content.xml is correct and
  # the generated file is a PDF (starts with '%PDF'). However this doesn't test if the merge is good, although it assures a lot of steps are working.
  test 'generate contract' do
    FileUtils::rm_rf Rails.public_path + '/contracts/generated/scholarships/test/'
    assert_equal '/contracts/generated/scholarships/test/rodrigo.pdf',
      Contract::generate('scholarship', {'name' => 'Rodrigo Rosenfeld', 'address' => 'R. Nascimento Silva, 107', 'total' => 4090.49},
      'scholarships/test/rodrigo', :tables => [{:table_name => 'Items', :line => 2, :fields => [{'name' => 'Books', 'value'=> 90.49},
           {'name' => 'Airline Ticketings for International Congress', 'value' => 4000.00}]}],
         :attachment => 'scholarships/contract_terms.pdf')
    assert FileUtils::identical?(Rails.root.to_s + '/test/fixtures/expected_content.xml',
      Rails.public_path + '/contracts/generated/scholarships/test/content.xml')
    f = File.new(Rails.public_path + '/contracts/generated/scholarships/test/rodrigo.pdf')
    assert_equal '%PDF', f.read(4) # Is the output a pdf?
  end
end
