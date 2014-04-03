class TextsController < ApplicationController

  def index
    
  end
  
  def show
    
  end
  
  def catullus
    render :catullus, layout: "reading"
  end
  
  def vergil
    render :vergil, layout: "reading"
  end
  
  def vf
    render :vf, layout: "reading"
  end

end
