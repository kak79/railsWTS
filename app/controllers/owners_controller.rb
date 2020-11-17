class OwnersController < ApplicationController

  include ApplicationHelper

  before_action :find_owner, only: [:show, :edit, :update, :destroy]

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owner_path(@owner)
    else
      redirect_to new_owner_path
    end
  end

  def index
    @owner = Owner.all
    @cars = Car.all
    @campers = Camper.all
  end

  def show
    if !logged_in?
      redirect_to login_path
    end
  end

  def update
    @owner.update(owner_params)
    redirect_to owner_path(@owner)
  end

  def destroy
    @owner.destroy
    redirect_to owners_path
  end

end
