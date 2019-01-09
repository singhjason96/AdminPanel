class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end

  def new
   @user = User.new
   
  end

  def create 
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
     
      render 'new'
    end
  end

  

  def index
    @users = User.all

  end

  def edit
    
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    respond_to do |format|
      format.html {redirect_to users_url}
      format.json {head :no_content}
      format.js {render :layout=>false}
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

