class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

    def show
    @program = Program.find(params[:id])
  end

  def edit
    @program = Program.find(params[:id])
  end

  def new
  end

  def update
    @program = Program.find(params[:id])
    @program.update(name: params[:name])
    redirect_to "/programs/#{@program.id}"
  end

  def destroy
    Program.destroy(params[:id])
    redirect_to "/programs"
  end
end
