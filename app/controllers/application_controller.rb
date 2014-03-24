class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def strip_tags(string)
    working_copy = string.dup
    
    end_of_tag = working_copy.index(">")
    working_copy = working_copy[(end_of_tag + 1)..-1]
    
    start_of_tag = working_copy.index("<")
    working_copy = working_copy[0...start_of_tag]
    working_copy.strip
  end
end
