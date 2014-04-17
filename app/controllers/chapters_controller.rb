class ChaptersController < ApplicationController
  
  def show
    @chapter = Chapter.includes(
      :sections,
      :prose_book,
      :prose_work,
      :author
    ).find(params[:id])
    @sections = @chapter.sections
  end

end
