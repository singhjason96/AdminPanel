class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])

  end

  def new
   @user = User.new
   @cohorts = Cohort.all
  end

  def create 
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
    else
      p @user.errors.messages
      render 'new'
    end
  end

  

  def index
  end
end

private
def user_params
  params.require(:user).permit(:role, :first_name, :last_name, :age, :salary, :level_of_education)
end


