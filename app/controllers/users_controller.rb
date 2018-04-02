class UsersController < ApplicationController
  def show
    #@user = User.find(current_user.id)
    @user = User.find(params[:id])
  end
  
  def profile
    @user = User.find(current_user.id)
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
  
  def edit
    @user = User.find(1)
  end
  
  def members
    if params[:query]
      @users = User.search(params[:query])
    else
      @users = User.all
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :school, :tags, :research, :password, :password_confirmation)
  end
end
