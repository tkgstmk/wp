class UsersController < ApplicationController
  def goal
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  # def edit
  #   @project = Project.find(params[:id])
  #   @user = current_user
  # end

  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    elsif
      render :edit
    end
  end

  
  protected
  def user_params
    params.require(:user).permit(:goal, :name, :email)
  end
end