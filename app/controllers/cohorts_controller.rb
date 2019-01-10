class CohortsController < ApplicationController
  def edit
    @cohort = Cohort.find(params[:id])
    @cohorts = Cohort.all
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
    # @cohort = Cohort.find(params[:cohort_id])
  end

  def update 
    @cohort = Cohort.find(params[:id])
    if @cohort.update(cohort_params[:id])
      redirect_to @cohort, notice: "Cohort Updated"
    end
  end

  def destroy 
    @cohort = Cohort.find(params[:id])
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_path }
      format.json { head :no_content }
      format.js { render :layout => false }
    end
  end
    



  private
  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date)
  end
   
end
