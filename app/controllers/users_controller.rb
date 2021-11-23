class UsersController < ApplicationController
  def goal
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
  end

  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to projects_path
  end
  
  protected
  def project_params
    params.require(:user).permit(:goal, :name, :email)
  end
end