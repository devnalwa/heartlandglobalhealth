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

  def members
    puts params
    if params[:query]
      @users = User.search(params[:query])
    else
      @users = []
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :school, :interests, :password, :password_confirmation)
  end
end
