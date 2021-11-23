class HomesController < ApplicationController

  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  
  def project_params
    params.require(:project).permit(:user_id, :title, :explanation, :image, :start_time)
  end
end
