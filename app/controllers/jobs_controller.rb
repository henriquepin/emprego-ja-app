class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new job_parameters
    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      flash[:error] = "Não foi possível criar a vaga"
      render :new
    end
  end

  private
  def job_parameters
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end
end
