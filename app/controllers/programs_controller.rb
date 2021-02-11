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
    Program.create(programs_params)

    redirect_to "/galleries/#{params[:id]}/programs"
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    Program.find(params[:id]).update(programs_params)
    redirect_to params[:previous_request]
  end

  def destroy
    Program.destroy(params[:id])
    redirect_to params[:previous_request]
  end

  private

  def programs_params
    params.permit(:gallery_id, :name, :number_of_participants).merge(params[:program])
  end
end
