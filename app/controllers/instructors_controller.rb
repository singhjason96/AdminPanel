class InstructorsController < ApplicationController
  
    def show
      @instructor = Instructor.find(params[:id])
  
    end
  
    def new
     @instructor = Instructor.new
     @cohorts = Cohort.all
    end
  
    def create 
      @instructor = Instructor.new(instructor_params)
      if @instructor.valid?
        @instructor.save
        redirect_to "/instructors/#{@instructor.id}"
      else
        @errors = @instrcutor.errors.full_messages
        @cohorts = Cohort.all
        render 'new'
      end
    end
  
  def edit 
    @instructor = Instructor.find(params[:id])
    @cohorts = Cohort.all
  end 
    
  
    def index
      @instructors = Instructor.all
  
    end

    def update 
      @instructor = Instructor.find(params[:id])
      if @instructor.update(instructor_params)
        redirect_to @instructor, notice: 'Instructor Updated.'
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
  
  
  
    private
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end


    def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :email, :age, :salary, :level_of_education, :cohort_id)
    end
end
