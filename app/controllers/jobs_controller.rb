class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end
  def create
  end
end
