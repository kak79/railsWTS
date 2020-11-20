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

  def find_campgallery
    @campgallery = Campgallery.find_by_id(params[:id])
    redirect_to owner_camper_campgalleries_path(@owner,@camper) if !@campgallery
  end  
  
  def find_cargallery
    @cargallery = Cargallery.find_by_id(params[:id])
    redirect_to owner_car_cargalleries_path(@owner,@car) if !@cargallery
  end

  def set_camper
   @camper = Camper.find_by_id(params[:camper_id])
   redirect_to owner_campers_path(@owner) if !@camper
  end

  def set_car
    @car = Car.find_by_id(params[:car_id])
    redirect_to owner_cars_path(@owner) if !@car
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
    params.require(:user).permit(:name, :user_name, :avatar, :password)
  end

  def car_params
    params.require(:car).permit(:car_model, :owner, :picture, :year, :description, :owner_id)
  end

  def camper_params
    params.require(:camper).permit(:camper_model, :owner, :picture, :year, :description, :owner_id)
  end

  def cargallery_params
    params.require(:cargallery).permit(:owner_id, :car_id, :picture_1, :description_1, :picture_2, :description_2, :picture_3, :description_3, :picture_4, :description_4, :picture_5, :description_5)
  end

  def campgallery_params
    params.require(:campgallery).permit(:owner_id, :camper_id, :picture_1, :description_1, :picture_2, :description_2, :picture_3, :description_3, :picture_4, :description_4, :picture_5, :description_5)
  end

  def owner_params
    params.require(:owner).permit(:owner_name, :user_id)
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

  def current_owner
    
  end

  def current_car

  end

end
