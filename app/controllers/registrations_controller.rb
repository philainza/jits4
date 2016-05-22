class RegistrationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_open_mat

  def index
    @registrations = @open_mat.registrations
  end

  def new
    @registration = @open_mat.registrations.new
  end

  def create
    @registration = @open_mat.registrations.new
    @registration.user = current_user
    if @registration.save
      redirect_to @open_mat,
                      notice: "Thanks for your registration!"
    else
      render :new
    end
  end

private
  
  def registration_params
    params.require(:registration).permit(:user_id)
  end

  def set_open_mat
    @open_mat = OpenMat.find(params[:open_mat_id])
  end
end
