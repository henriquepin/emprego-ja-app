class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @jobs = Job.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create company_parameters
    redirect_to @company
  end

  private
  def company_parameters
    params.require(:company).permit(:name, :location, :mail, :phone)
  end
end
