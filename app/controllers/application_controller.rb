class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]

  before_action :configure_permitted_parameters,if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path
    else
      render:new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
