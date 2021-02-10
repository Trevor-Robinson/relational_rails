class ProgramsController < ApplicationController

  def index
    @programs = Program.where('number_of_participants > ?', params[:number_of_participants]|| 0).order(params[:sort], created_at: :desc)
  end

  def show
    @program = Program.find(params[:id])
  end

  def new
  end

  def create
    gallery = Gallery.find(params[:gallery_id])
    gallery.programs.create({
                              name: params[:program][:name],
                              number_of_participants: params[:program][:number_of_participants],
                              })
    redirect_to "/gallerys/#{params[:gallery_id]}/programs"
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    @program.update({
                      name: params[:program][:name],
                      number_of_participants: params[:program][:number_of_participants],
                      })

    redirect_to params[:previous_request]
  end

  def destroy
    Program.destroy(params[:id])
    redirect_to params[:previous_request]
  end
end
