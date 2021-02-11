class MuseumsController < ApplicationController
  def index
    # @museums = Museum.all.order(created_at: :desc)
    @museums = Museum.order(created_at: :desc)
  end

  def new

  end

  def create
    museum = Museum.new({
      name: params[:museum][:name],
      city: params[:museum][:city],
      admission_cost: params[:museum][:admission_cost],
      old_masters: params[:museum][:old_masters],
      architect: params[:museum][:architect]
      })
    museum.save
    redirect_to "/museums"
  end

  def show
    @museum = Museum.find(params[:id])
  end

  def edit
    @museum = Museum.find(params[:id])
  end

  def update
    museum = Museum.find(params[:id])
    museum.update({
      name: params[:museum][:name],
      city: params[:museum][:city],
      admission_cost: params[:museum][:admission_cost],
      old_masters: params[:museum][:old_masters],
      architect: params[:museum][:architect]
      })
    museum.save
    redirect_to "/museums/#{museum.id}"
  end

  def destroy
    Museum.destroy(params[:id])
    redirect_to '/museums'
  end

  def works
    @museum = Museum.find(params[:id])
    if params.include?(:greater_than)
      @works = @museum.works.where('year > ?', params[:greater_than].to_i)
    else
      @works = @museum.works.order(params[:sort])
    end
  end
end
