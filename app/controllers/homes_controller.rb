class HomesController < ApplicationController

  def index
    @projects = Project.all.order(start_time: :desc)
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  
  def project_params
    params.require(:project).permit(:user_id, :title, :explanation, :image, :start_time)
  end
end
