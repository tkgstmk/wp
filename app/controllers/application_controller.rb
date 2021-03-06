class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when User
      projects_path
    end
  end
  
  def after_sign_up_path_for(resource)
    case resource
    when User
      goal_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when :user
      root_path
    end
  end
  
  # def after_sign_out_path_for(resource)
  # リダイレクト先のパス
  # end 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :number])
  end
end
