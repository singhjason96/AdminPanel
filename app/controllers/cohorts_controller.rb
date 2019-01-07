class CohortsController < ApplicationController
  def edit
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def new
    @cohort = Cohort.new

  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
      redirect_to "/cohorts/#{@cohort.id}"
    else 
      p @cohort.errors.messages
      render 'new'
    end
  end
  def index
    @cohorts = Cohort.all
  end

  private
  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date)
  end
   
end
