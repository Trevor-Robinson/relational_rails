class WorksController < ApplicationController
  def index
    @works = Work.where(on_display: "true")
  end

  def new

  end

  def create
    work = Work.new({
      name: params[:work][:name],
      artist: params[:work][:artist],
      year: params[:work][:year],
      on_display: params[:work][:on_display],
      medium: params[:work][:medium],
      museum_id: params[:work][:museum_id]
      })
    work.save
    redirect_to "/museums/#{work.museum_id}/works"
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update({
      name: params[:work][:name],
      artist: params[:work][:artist],
      year: params[:work][:year],
      on_display: params[:work][:on_display],
      medium: params[:work][:medium]
      })
    work.save
    redirect_to "/works/#{work.id}"
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to '/works'
  end
end
