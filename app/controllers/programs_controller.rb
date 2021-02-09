class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def new
  end

  def create
  gallery = Gallery.create({
                            name: params[:program][:name],
                            number_of_participants: params[:program][:number_of_participants],
                            })

    redirect_to "/galleries/#{params[:gallery_id]}/programs"


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

    redirect_to "/programs/#{params[:id]}"
  end
end
