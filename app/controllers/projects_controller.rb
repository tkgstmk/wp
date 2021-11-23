class ProjectsController < ApplicationController
  def index
    @user = current_user
    @projects = current_user.projects
    # ↑後でcurrent_user
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
    redirect_to projects_path
    else
      # @project= Project.all
      @user = current_user
      @projects = current_user.projects
      render :index
    end
  end

  def show
    @project = Project.find(params[:id])
    @user = current_user
  end
  
  

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice:"削除しました"
  end

  def edit
    @project = Project.find(params[:id])
    @user = current_user
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path, notice: "編集しました"
    else
      render 'edit'
    end
  end
  
 
  
  
  
  def project_params
    params.require(:project).permit(:user_id, :title, :explanation, :image, :start_time)
  end
end
