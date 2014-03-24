class DefinitionsController < ApplicationController

  def show
    require 'open-uri'
    
    url = "http://lysy2.archives.nd.edu/cgi-bin/words.exe?#{params[:latin_word]}"
    doc = Nokogiri::HTML(open(url))
  end

end
