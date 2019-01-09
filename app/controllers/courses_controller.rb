class CoursesController < ApplicationController
  def edit
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new

  end

  def create
    @course = Course.new(course_params)
    if @course.valid?
      @course.save
      redirect_to "/cohorts/#{@cohort.id}/courses"
    else 
      p @course.errors.messages
      render 'new'
    end
  end

  
 

  def index
    @courses = Course.all
  
  end


  private
  def course_params
  params.require(:course).permit(:name, :start_time, :end_time, :cohort_id)
  end
end
