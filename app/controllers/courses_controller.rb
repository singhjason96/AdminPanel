class CoursesController < ApplicationController
  def edit
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    @cohort = Cohort.find(params[:cohort_id])

  end

  def create
    @course = Course.new(course_params)
    @cohort_id = params[:cohort_id]
    @course_id = params[:course_id]
    @course.cohort_id = params[:cohort_id]
    if @course.valid?
      @course.save
      redirect_to "/cohorts/#{@cohort_id}/courses/#{@course_id}"
    else 
      p @course.errors.messages
      render 'new'
    end
  end

  
 

  def index
    @courses = Course.all
    @cohort = Cohort.find(params[:cohort_id])

  end


  private
  def course_params
  params.require(:course).permit(:name, :start_time, :end_time, :cohort_id, :course_id)
  end
end
