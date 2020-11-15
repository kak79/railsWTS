class CampersController < ApplicationController

  include ApplicationHelper

  before_action :find_camper, only: [:show, :edit, :update, :destroy]

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    if @camper.save
      redirect_to camper_path(@camper)
    else
      redirect_to new_camper_path
    end
  end

  def index
    @camper = Camper.all
  end

  def show
    if !logged_in?
      redirect_to login_path
    end
  end

  def update
    @camper.update(camper_params)
    redirect_to camper_path(@camper)
  end

  def destroy
    @camper.destroy
    redirect_to campers_path
  end

end
