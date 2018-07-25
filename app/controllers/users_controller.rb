class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:notice] = "Invalid input. Please try again."
      render :new
    end
  end

  def dashboard
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
