#encoding: ISO-8859-1
require 'open-uri'
require 'nokogiri'
require_relative 'comment'  

puts "--- Parsing HTML document.." 
# Nokogiri opens the url passed through command line
doc = Nokogiri::HTML(open(ARGV[0]))
puts "--- done!"

cc = 0 # comment_counter
contents        = []
authors         = []
medium_ratings  = []
votes_numbers   = []

# PARSE COMMENTS DATA
puts "--- Parsing Comments Nodes..."
doc.css('#commentsToSort .comment-posted').each_with_index do |cpn, i|
  contents[i]       = Comment.get_comment_content_for cpn # cpn: comment-posted current node
  authors[i]        = cpn.css('tr:first-child td b').inner_html
  medium_ratings[i] = cpn.css('li.current-rating').inner_html
  votes_numbers[i]  = cpn.css('tr:first-child td.numvote').inner_html
  cc = cc + 1
end

# CREATING COMMENT OBJECTS
puts "--- Creating comment objects..."
comments = []
i = 0 
while i < cc
  comments[i] = Comment.new( i+1, contents[i], authors[i], medium_ratings[i], votes_numbers[i], Time.now)
  i = i+1  
end 

puts "--- Sorting Comments by Rating..."
comments.sort!

puts "--- Writing Results:"
i = 0
while i < cc
  puts comments[i]
  i = i +1
end     

