class GalleriesController < ApplicationController

  def index
    if params[:sort]
      @galleries = Gallery.select("galleries.*, COUNT(*) AS count")
                                  .left_outer_joins(:programs)
                                  .group(:id)
                                  .where('capacity > ?', params[:capacity]|| 0)
                                  .order(count: :desc, tech_support: :desc, created_at: :desc)
    else
      @galleries = Gallery.where('capacity > ?', params[:capacity]|| 0).order(tech_support: :desc, created_at: :desc)
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
  end

  def create
    Gallery.create(gallery_params)

    redirect_to '/galleries'
  end

  def edit
     @gallery = Gallery.find(params[:id])
  end

   def update
     Gallery.find(params[:id]).update(gallery_params)

     redirect_to params[:previous_request]
   end

   def destroy
     Gallery.destroy(params[:id])
     redirect_to '/galleries'
   end

   private

   def gallery_params
     params.permit(:name, :has_projector, :capacity)
   end
 end
