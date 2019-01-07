class StudentsController < ApplicationController
    def edit
    end
  
    def show
      @student = Student.find(params[:id])
  
    end
  
    def new
     @student = Student.new
     @cohorts = Cohort.all
    end
  
    def create 
      @student = Student.new(student_params)
      if @student.valid?
        @student.save
        redirect_to "/students/#{@student.id}"
      else
        @errors = @student.errors.full_messages
        @cohorts = Cohort.all
        render 'new'
      end
    end
  
    
  
    def index
      @students = Student.all
  
    end
  
  
    private
    def student_params
      params.require(:student).permit(:role, :first_name, :last_name, :email, :age,:level_of_education, :cohort_id)
    end
  
end
