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

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
    if @job.update job_parameters
      redirect_to @job
    else
      @companies = Company.all
      flash[:error] = "Não foi possível atualizar a vaga"
      render :edit
    end
  end

  private
  def job_parameters
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end
end
