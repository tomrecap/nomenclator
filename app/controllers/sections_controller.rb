class SectionsController < ApplicationController
  
  def show
    @section = Section.includes(
      :chapter,
      :prose_book,
      :prose_work,
      :author
    ).find(params[:id])
  end

end
