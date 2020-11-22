# frozen_string_literal: true
# Cars that are Owned are Built, Edited, Displayed and Deleted in this Class

class CarsController < ApplicationController
  include ApplicationHelper
  before_action :set_owner
  before_action :find_car, only: %I[show edit update destroy]

  def new
    @car = @owner.cars.new
  end

  def create
    @car = @owner.cars.new(car_params)
    if @car.save
      redirect_to owner_car_path(@owner, @car)
    else
      render :new 
    end
  end

  def index
    @cars = Car.all
    redirect_to owner_path(@owner)
  end

  def show
    return unless verify
  end

  def update
    if !@car
      render :new
    else
      @car.update(car_params)
      redirect_to owner_car_path(@owner, @car)
    end
  end

  def destroy
    @car.destroy
    redirect_to owner_cars_path(@owner)
  end
end
