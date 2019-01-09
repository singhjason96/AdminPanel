class StudentsController < ApplicationController
  
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

    def edit
      @student = Student.find(params[:id])
      @cohorts = Cohort.all
    end
  
    def index
      @students = Student.all
  
    end

    def update
      @student = Student.find(params[:id])
      if @student.update(student_params)
        redirect_to @student, notice: 'Student Updated'
      end
    end

    def destroy 
      @student = Student.find(params[:id])
      @student.destroy
      respond_to do |format|
        format.html { redirect_to students_path }
        format.json { head :no_content }
        format.js { render :layout => false }
      end
    end

  
  
    private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:role, :first_name, :last_name, :email, :age,:level_of_education, :cohort_id)
    end
  
end
