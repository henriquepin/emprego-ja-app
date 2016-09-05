class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update]
  
  def show
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
    @companies = Company.all
  end

  def update
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

  def set_job
    @job = Job.find(params[:id])
  end
end
