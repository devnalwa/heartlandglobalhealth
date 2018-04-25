class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.save
       redirect_to @user
     else
       render 'new'
     end
  end
  
  def profile
    @user = User.find(current_user.id)
  end

  def members
    if params[:query]
      @users = User.search(params[:query])
    else
      @users = User.all
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :school, :research, :password, :password_confirmation)
  end
end
