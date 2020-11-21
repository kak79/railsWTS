module ApplicationHelper

  def find_user
    @user = User.find_by_id(params[:id])
    redirect_to users_path if !@user
  end

  def find_car
    @car = Car.find_by_id(params[:id])
    redirect_to owner_cars_path(@owner) if !@car
  end

  def find_camper
    @camper = Camper.find_by_id(params[:id])
    redirect_to owner_campers_path(@owner) if !@camper
  end

  def set_owner
    @owner = Owner.find_by_id(params[:owner_id])
    redirect_to owners_path if !@owner
  end

  def find_owner
    @owner = Owner.find_by_id(params[:id])
    redirect_to owners_path if !@owner
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :avatar, :password)
  end

  def car_params
    params.require(:car).permit(:make, :car_model, :owner, :picture_1, :picture_2, :year, :description, :owner_id)
  end

  def camper_params
    params.require(:camper).permit(:make, :camper_model, :owner, :picture_1, :picture_2, :year, :description, :owner_id)
  end

  def owner_params
    params.require(:owner).permit(:owner_name, :user_id)
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by_id(session[:email_id])
  end

  def verify
    if !logged_in?
      redirect_to login_path
    end
  end

end
