# frozen_string_literal: true
# Campers that are Owned are Built, Edited, Displayed and Deleted in this Class

class CampersController < ApplicationController
  include ApplicationHelper
  before_action :set_owner
  before_action :find_camper, only: %I[show edit update destroy]

  def new
    @camper = @owner.campers.new
  end

  def create
    @camper = @owner.campers.new(camper_params)
    if @camper.save
      redirect_to owner_camper_path(@owner, @camper)
    else
      render :new
    end
  end

  def index
    @campers = Camper.all
    redirect_to owner_path(@owner)
  end

  def show
    return unless verify
  end

  def update
    if !@camper
      render :new
    else
      if @camper.update(camper_params)
        redirect_to owner_camper_path(@owner, @camper)
      else   
        render :edit
      end
    end
  end

  def destroy
    @camper.destroy
    redirect_to owner_campers_path(@owner)
  end
end
