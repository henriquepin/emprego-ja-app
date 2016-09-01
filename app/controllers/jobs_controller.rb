class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create job_parameters
    redirect_to @job
  end

  private
  def job_parameters
    params.require(:job).permit(:title, :location, :category, :company, :description)
  end
end
