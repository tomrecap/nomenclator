class StaticPagesController < ApplicationController

  def show
    url = "http://lysy2.archives.nd.edu/cgi-bin/words.exe?#{params[:latin_word]}"
    doc = Nokogiri::HTML(open(url))
  end

end
