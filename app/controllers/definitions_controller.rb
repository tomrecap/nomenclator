class DefinitionsController < ApplicationController

  def show
    require 'open-uri'
    
    url = "http://perseus.uchicago.edu/perseus-cgi/morph.pl?token=#{params[:q]}&lang=latin"    
    doc = Nokogiri::HTML(open(url))
    
    result = {
      token: doc.at_css("td.token"),
      lemma: doc.at_css("th.lemma"),
      lemmaDefinition: doc.at_css(".shortdef"),
      form: doc.at_css("td.code")
    }
    
    if result[:token]    
      result.each do |key, value|
        result[key] = strip_tags(value.to_s)
      end
    
      render json: result
    else
      render json: result, status: 404
    end
  end

end
