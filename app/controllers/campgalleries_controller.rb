class CampgalleriesController < ApplicationController
  include ApplicationHelper
  before_action :set_owner
  before_action :set_camper
  before_action :find_campgallery, only: [:show, :edit, :update]

  def new
    @campgallery = @camper.campgalleries.new
  end

  def create
    @campgallery = @camper.campgalleries.new(campgallery_params)
    if @campgallery.save
      redirect_to owner_camper_campgallery_path(@owner,@camper,@campgallery)
    else
      redirect_to new_owner_camper_campgallery_path(@owner,@camper)
    end
  end

  def index
    @campgalleries = Campgallery.all
    if !@campgalleries.present?
      redirect_to new_owner_camper_campgallery_path(@owner,@camper)
    end
  end

  def update
    @campgallery.update(campgallery_params)
    redirect_to owner_camper_campgallery_path(@owner,@camper,@campgallery)
  end
end
