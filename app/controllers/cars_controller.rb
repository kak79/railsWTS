class CarsController < ApplicationController

  include ApplicationHelper

  before_action :find_owner
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = @owner.cars.new
  end

  def create
    @car = @owner.cars.new(car_params)
    if @car.save
      redirect_to owner_car_path(@owner,@car)
    else
      redirect_to new_owner_car_path
    end
  end

  def index
    @cars = Car.all
  end

  def show
    if !logged_in?
      redirect_to login_path
    end
  end

  def update
    @car.update(car_params)
    redirect_to owner_car_path(@owner,@car)
  end

  def destroy
    @car.destroy
    redirect_to owner_cars_path(@owner)
  end

end
