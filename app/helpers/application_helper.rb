# frozen_string_literal: true
# all helper methods for every class are here

module ApplicationHelper
  def find_user
    @user = User.find_by(id: params[:id]) 
    redirect_to new_user_path if !@user
  end

  def find_car
    @car = Car.find_by(id: params[:id])
    redirect_to owner_cars_path(@owner) if !@car
  end

  def find_camper
    @camper = Camper.find_by(id: params[:id])
    redirect_to owner_campers_path(@owner) if !@camper
  end

  def set_owner
    @owner = Owner.find_by(id: params[:owner_id])
    redirect_to owners_path if !@owner
  end

  def find_owner
    @owner = Owner.find_by(id: params[:id])
    redirect_to owners_path if !@owner
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :avatar, :password)
  end

  def car_params
    params.require(:car).permit(:make, :car_model, :owner, :picture_one, :picture_two, :year, :description, :owner_id)
  end

  def camper_params
    params.require(:camper).permit(:make, :camper_model, :owner, :picture_one, :picture_two, :year, :description, :owner_id)
  end

  def owner_params
    params.require(:owner).permit(:owner_name, :user_id)
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:email_id])
  end

  def verify
    redirect_to login_path unless logged_in?
  end
end
