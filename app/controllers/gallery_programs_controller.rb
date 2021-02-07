class GalleriesProgramsController < ApplicationController

  def index
    @gallery = Gallery.find(params[:id])
    if params[:sort]
      @programs = @gallery.programs.sort_alphabetically
    else
      @programs = @gallery.programs
    end
  end

  def new
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.find(params[:id])
    @gallery.programs.create(name: params[:name])
    redirect_to "/galleries/#{@gallery.id}/programs"
  end
end
