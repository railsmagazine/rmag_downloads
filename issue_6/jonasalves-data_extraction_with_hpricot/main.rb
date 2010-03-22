#!/usr/bin/env ruby
require 'ruby_inside_extractor'

ri_extractor = RubyInsideExtractor.new
ri_extractor.import!
ri_extractor.blog_posts.each{ |post|
  puts post.title
  puts '=' * post.title.size
  puts 'by ' + post.author
  puts
  puts post.text
  puts
  post.comments.each do |comment|
    puts '~' * 10
    puts comment.sender + ' says:'
    puts comment.text
  end
  puts
}
