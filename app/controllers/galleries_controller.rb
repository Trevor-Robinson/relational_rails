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

   private

  def programs_params
    params.permit(:gallery_id, :name, :number_of_participants).merge(params[:program])
  end
 end
