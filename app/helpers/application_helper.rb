module ApplicationHelper

  def find_user
    @user = User.find_by_id(params[:id])
    redirect_to users_path if !@user
  end

  def find_car
    @car = Car.find_by_id(params[:id])
    redirect_to cars_path if !@car
  end

  def find_camper
    @camper = Camper.find_by_id(params[:id])
    redirect_to campers_path if !@camper
  end

  def find_owner
    @owner = Owner.find_by_id(params[:id])
    redirect_to owners_path if !@owner
  end

  def user_params
    params.require(:user).permit(:name, :user_name, :avatar, :password)
  end

  def car_params
    params.require(:car).permit(:car_model, :owner, :picture, :year, :description)
  end

  def camper_params
    params.require(:camper).permit(:camper_model, :owner, :picture, :year, :description)
  end

  def owner_params
    params.require(:owner).permit(:user_id, :car_id, :camper_id)
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by_id(session[:user_name_id])
  end

  def verify
    if !logged_in?
      redirect_to login_path
    end
  end

end
