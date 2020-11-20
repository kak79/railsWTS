class CargalleriesController < ApplicationController
  include ApplicationHelper
  before_action :set_owner
  before_action :set_car
  before_action :find_cargallery, only: [:show, :edit, :update]

  def new
    @cargallery = @car.cargalleries.new
  end

  def create
    @cargallery = @car.cargalleries.new(cargallery_params)
    if @cargallery.save
      if params[:cargallery]['car_image'].length <= 10
        params[:cargallery]['car_image'].each do |a|
           @cargallery = @car.cargallery.create!(:car_image => a, :car_id => @car.id)
      end
    elsif params[:cargallery]['car_image'].length > 10
      flash[:error] = '!'
      redirect_to ????
      return false
      redirect_to @car, notice: "Car Gallery Saved" 
    else
     if params[:cargallery]['car_image'].length > 10
        @car.errors[:base] << "Maximuim 10 pictures."
     end
     redirect_to new_owner_car_cargallery_path(@owner,@car)
    end
  end

  def update
    @cargallery.update(car_params)
    redirect_to owner_car_cargallery_path(@owner,@car,@cargallery)
  end

  def show
    if !@car.cargallery.present?
      redirect_to new_owner_car_cargallery_path(@owner,@car)
    end
  end
  
end
