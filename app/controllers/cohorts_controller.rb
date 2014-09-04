class CohortsController < ApplicationController
   before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  def index
    @cohorts = Cohort.all
  end

  def new
    @courses = Course.all
    @locations = Location.all
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.create cohort_params
    if @cohort.save == true
      redirect_to cohorts_path
    else
      render :new
    end
  end

  def show
    @enrollments = Enrollment.all
  end

  def edit
  end

  def update
    @cohort.update_attributes cohort_params
    redirect_to cohort_path(@cohort)
  end

  def destroy
    @cohort.delete
    redirect_to cohorts_path
  end
private
  def cohort_params
    params.require(:cohort).permit(:start_date, :location_id, :course_id)
  end
  def find_cohort
    @cohort = Cohort.find params[:id]
  end

end
