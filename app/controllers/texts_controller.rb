class TextsController < ApplicationController

  def index
    
  end
  
  def show
    
  end
  
  def catullus
    render :catullus, layout: "reading_old"
  end
  
  def vergil
    render :vergil, layout: "reading_old"
  end
  
  def vf
    render :vf, layout: "reading_old"
  end

end
