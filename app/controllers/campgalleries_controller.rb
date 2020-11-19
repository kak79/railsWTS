class CampgalleriesController < ApplicationController
  include ApplicationHelper
  before_action :set_owner
  before_action :set_car
  before_action :find_campgallery, only: [:show, :edit, :update]

  def new
    @campgallery = @owner.car.campgalleries.new
  end

  def create
    @campgallery = @owner.car.campgalleries.new(campgallery_params)
    if @campgallery.save
      redirect_to owner_car_campgallery_path(@owner,@car,@campgallery)
    else
      redirect_to new_owner_car_campgallery_path(@owner,@car)
    end
  end

  def index
    @campgalleries = Campgallery.all
  end

  def update
    @campgallery.update(car_params)
    redirect_to owner_car_campgallery_path(@owner,@car,@campgallery)
  end
end
