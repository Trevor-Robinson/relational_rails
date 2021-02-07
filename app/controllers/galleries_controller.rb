class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @venue = Gallery.find(params[:id])
  end

  def new
  end

  def create
    Gallery.create(name: params[:name],
                 capacity: params[:capacity],
                 tech_support: params[:tech_support])

                 gallery.save
    redirect_to "/galleries"
  end

  def edit
    @venue = Gallery.find(params[:id])
  end

  def update
    new_gallery = Gallery.find(params[:id])
    new_gallery.update(name: params[:name],
                 capacity: params[:capacity],
                 tech_support: params[:tech_support])
    redirect_to "/galleries/#{new_gallery.id}"
  end

  def destroy
    Gallery.destroy(params[:id])
    redirect_to '/galleries'
  end
end
