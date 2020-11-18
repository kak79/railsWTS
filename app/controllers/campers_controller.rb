class CampersController < ApplicationController

  include ApplicationHelper

  
  before_action :set_owner
  before_action :find_camper, only: [:show, :edit, :update, :destroy]

  def new
    @camper = @owner.campers.new
  end

  def create
    @camper = @owner.campers.new(camper_params)
    if @camper.save
      redirect_to owner_camper_path(@owner,@camper)
    else
      redirect_to new_owner_camper_path
    end
  end

  def index
    @campers = Camper.all
  end

  def show
    if !logged_in?
      redirect_to login_path
    end
  end

  def update
    @camper.update(camper_params)
    redirect_to owner_camper_path(@owner,@camper)
  end

  def destroy
    @camper.destroy
    redirect_to owner_campers_path(@owner)
  end

end
