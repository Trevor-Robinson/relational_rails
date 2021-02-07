class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
  end

  def create
    gallery = Gallery.create({
                              name: params[:gallery][:name],
                              tech_support: params[:gallery][:tech_support],
                              capacity: params[:gallery][:capacity]
                              })

    redirect_to '/galleries'
  end

  def edit
     @gallery = Gallery.find(params[:id])
  end

   def update
     gallery = Gallery.find(params[:id])
     gallery.update({
                     name: params[:gallery][:name],
                     tech_support: params[:gallery][:tech_support],
                     capacity: params[:gallery][:capacity]
                     })
     redirect_to "/galleries/#{gallery.id}"
   end

   def destroy
     Gallery.destroy(params[:id])
     redirect_to '/galleries'
   end
 end
