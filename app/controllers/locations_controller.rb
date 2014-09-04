class locationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_location, only: [:show, :edit, :update, :destroy]
  

  def index
    @locations = location.all
  end

  def show
    
  @location = Location.find params[:id]
  @clients = @location.clients
  end

  def new
    @location = Location.new

  end

  def create
    @location = Location.create location_params
    if @location.save == true
    redirect_to locations_path
    else
    render :new
    end
  end
   
  def edit
    @location = Location.find params[:id]
  end

  def update
    @location = Location.find params[:id]
    @location.update_attributes location_params
    redirect_to locations_path
  end

  def destroy
    @location = Location.find params[:id]
    @location.delete
    redirect_to locations_path
  end
private
  def find_location
    @location = Location.find params[:id]
  end
  
  def location_params
    params.require(:location).permit(:city, :state)
  end
  
end
