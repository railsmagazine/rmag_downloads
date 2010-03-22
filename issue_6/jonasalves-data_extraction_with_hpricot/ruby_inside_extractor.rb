require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'blog_post'
require 'comment'

class RubyInsideExtractor
  attr_reader :blog_posts
  @@web_address = "http://www.rubyinside.com/"
  
  def initialize
    @blog_posts = []
  end
  
  def import!
    1.upto(page_count) do |page_number|
      page_doc = Hpricot(open(@@web_address + 'page/' + page_number.to_s))
      page_doc.search('.post.teaser').each do |entry_div|
        # we can access an element's attributes as if it were a Hash
        post_url = entry_div.at('h2 > a')['href']
        @blog_posts << extract_blog_post(post_url)
      end
    end
  end

  private

  def extract_blog_post(post_url)
    blog_post = BlogPost.new

    post_doc = Hpricot(open(post_url))
    blog_post.title = post_doc.at('.entryheader h1').inner_text
    blog_post.author = post_doc.at('p.byline a').inner_text
    text_div = post_doc.at('.entrytext')
    text_div.search('noscript').remove # removing unwanted elements
    blog_post.text = text_div.inner_text.strip
    
    blog_post.comments = extract_comments(post_doc.at('ol.commentlist'))
    
    blog_post
  end
  
  def extract_comments(comments_doc)
    comments = []
    comments_doc.search('li').each { |comment_doc|
      comment = Comment.new
      comment.sender = comment_doc.at('cite').inner_text.strip
      comment.text = comment_doc.at('p').inner_text.strip
      comments << comment
    } rescue nil
    comments
  end
  
  def page_count
    doc = Hpricot(open(@@web_address))
    # the number of the last page is in the penultimate link
    # inside the div with the class "pagebar"
    #return doc.search("div.pagebar a")[-2].inner_text.to_i

    return 3 # we're forcing a low number because it would
             # take long to extract all the 1060~ posts
  end
end
