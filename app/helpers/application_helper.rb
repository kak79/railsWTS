module ApplicationHelper

  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path if !@user
  end

  def user_params
    params.require(:user).permit(:name, :user_name, :avatar, :permission, :admin, :password, :password_confirmation)
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def verify
    if !logged_in?
      redirect_to users_path
    end
  end

 
end
