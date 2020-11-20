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
      redirect_to owner_car_cargallery_path(@owner,@car,@cargallery)
    else
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
