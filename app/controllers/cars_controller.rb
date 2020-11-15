class CarsController < ApplicationController

  include ApplicationHelper

  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      redirect_to new_car_path
    end
  end

  def index
    @car = Car.all
  end

  def show
    if !logged_in?
      redirect_to login_path
    end
  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

end
