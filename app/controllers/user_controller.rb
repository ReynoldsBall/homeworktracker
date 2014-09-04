lass UsersController < ApplicationController
   before_action :authenticate_user!
  before_action only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
    @location = Location.find params[:location_id] 
  end

  def search_users
    @users = User.where("last_name LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
end 

  def show
    @user = User.find(params[:id])
    
    @location = Location.find params[:location_id] 
  end


  def new
    @user = User.new
    @location = Location.find params[:location_id]
  end

  def edit
     @user = User.find(params[:id])
     @location = Location.find params[:location_id]
  end

  def create
    
    @location = Location.find params[:location_id]
    @user = @location.users.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = "user was added the Data Base"
        format.html { redirect_to location_path(@location) }
      else
        flash[:error] = "user was not added the Data Base"
        format.html { render :new }
      end
    end
  end

  def ontime
    @location = Location.find params[:location_id]
    @user.ontime!
    redirect_to users_url
  end

  def incomplete
    @location = Location.find params[:location_id]
    @user.incomplete!
    redirect_to users_url
  end

  def late
    @location = Location.find params[:location_id]
    @user.late!
    redirect_to users_url
  end

  def reviewed
    @location = Location.find params[:location_id]
    @user.reviewed!
    redirect_to users_url
  end

  def extratime
    @location = Location.find params[:location_id]
    @user.extratime!
    redirect_to users_url
  end

  def grade
    @location = Location.find params[:location_id]
    @user.grade!
    redirect_to users_url
  end

  
  def update
    @user = User.find(params[:id])
    @location = Location.find params[:location_id]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to location_path(@location), notice: 'user information updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @location = Location.find params[:location_id]
    @user.destroy
    respond_to do |format|
      format.html { redirect_to locations_path(@location), notice: 'user History Deleted'}
      format.json {head :no_content}
    end
  end


private
  
  
  def find_user
    @user = User.find params[:id]
  end

  def find_location
    @location = Location.find params[:location_id]
  end
    

    def user_params
    params.require(:user).permit(:firstname, :lastname, :github_url, :twitter, :description)
  end

end

