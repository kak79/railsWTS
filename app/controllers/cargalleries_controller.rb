class CargalleriesController < ApplicationController
  include ApplicationHelper
  
  before_action :set_car
  before_action :find_cargallery, only: [:show, :edit, :update]

  def index
    @cargallery = @car.cargallery 
    @car_images = @cargallery.car_image.all
   
  end

  def new
    @cargallery = Cargallery.new
  end

  def create
    @cargallery = Cargallery.new(cargallery_params)
    @cargallery.car = @car
    #binding.pry
    if @cargallery.save
      redirect_to car_cargallery_path(@car,@cargallery)
    else
     redirect_to new_car_cargallery_path(@car)
    end
  end

  def update
    @cargallery.update(car_params)
    redirect_to car_cargallery_path(@car,@cargallery)
  end

  def show
    @cargallery = @car.cargallery 
    @car_images = @cargallery.car_image.all

    
    if !@car.cargallery.present?
      redirect_to new_car_cargallery_path(@car)
    end
  end
  
end
