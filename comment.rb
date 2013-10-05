class Comment
  
  include Comparable
  
  attr_accessor :current_pos, :content, :author, :medium_rating, :votes_number, :last_updated_at
  attr_reader   :rating
  
  def initialize(current_pos, content, author, medium_rating, votes_number, last_updated_at)
    @current_pos = current_pos
    @content = content
    @author  = (author ? (author.force_encoding 'utf-8') : nil)
    @medium_rating    = (medium_rating ? medium_rating.to_s.sub!('Currently','').sub!('/5','').to_f : 0.0)
    @votes_number     = (votes_number ? votes_number.to_s.sub!('(voti: ', '').to_i : 0)
    @last_updated_at = last_updated_at
    if @medium_rating && @votes_number
      @rating = (@medium_rating * @votes_number + @votes_number*0.5).round(1)
    else
      @rating = 0
    end  
  end 
  
  # Extracts the comment contents from the current div.comment-posted node (cpn)
  def self.get_comment_content_for cpn
    node = cpn.previous_element
    node_contents = []
    i = 0
    while node && (node.node_name == 'p' || node.node_name == 'br')
      node_contents[i] = node.content
      i = i + 1
      node = node.previous_element
    end
    return node_contents.reverse.join
  end 
     
  def <=>(other)  
    self.rating <=> other.rating
  end
  
  def to_s
    s = "--------------------------\n"
    s = s +  "Current Position: ##{@current_pos}\n"
    s = s +  "Content:         #{@content}\n"
    s = s +  "Author:          #{@author}\n"
    s = s +  "Medium Rating:   #{@medium_rating}\n"
    s = s +  "Votes:           #{@votes_number}\n"
    s = s +  "Rating: #{@rating}\n"
    s = s +   "--------------------------"
    return s
  end
  
end  