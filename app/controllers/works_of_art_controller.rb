class WorksOfArtController < ApplicationController
  def index
    @works_of_art = WorkOfArt.all
  end

  def new

  end

  def create
    work_of_art = WorkOfArt.new({
      name: params[:work_of_art][:name],
      artist: params[:work_of_art][:artist],
      year: params[:work_of_art][:year],
      on_display: params[:work_of_art][:on_display],
      medium: params[:work_of_art][:medium]
      })
    work_of_art.save
    redirect_to "/works_of_art"
  end

  def show
    @work_of_art = WorkOfArt.find(params[:id])
  end

  def edit
    @work_of_art = WorkOfArt.find(params[:id])
  end

  def update
    work_of_art = WorkOfArt.find(params[:id])
    work_of_art.update({
      name: params[:work_of_art][:name],
      artist: params[:work_of_art][:artist],
      year: params[:work_of_art][:year],
      on_display: params[:work_of_art][:on_display],
      medium: params[:work_of_art][:medium]
      })
    work_of_art.save
    redirect_to "/works_of_art/#{work_of_art.id}"
  end

  def destroy
    WorkOfArt.destroy(params[:id])
    redirect_to '/works_of_art'
  end
end
