class OpenMatsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @open_mats = OpenMat.upcoming
  end

  def show
    @open_mat = OpenMat.find(params[:id])
  end

  def edit
    @open_mat = OpenMat.find(params[:id])
  end

  def update
    @open_mat = OpenMat.find(params[:id])
    if @open_mat.update(open_mat_params)
      current_user.create_activity(@open_mat, 'updated')
      redirect_to @open_mat
    else
      render :edit
    end
  end

  def new
    @open_mat = OpenMat.new
  end

  def create
    @open_mat = current_user.open_mats.new(open_mat_params)
    @open_mat.user = current_user
    if @open_mat.save
      current_user.create_activity(@open_mat, 'created')
      redirect_to @open_mat
    else
      render :new
    end
  end 

  def destroy
    @open_mat = OpenMat.find(params[:id])
    @open_mat.destroy
    redirect_to open_mats_url
  end

  private

    def open_mat_params
      params.require(:open_mat).permit(:location, :starts_at, :asset, :user_id, :host, :street_address, :city, :state, :country)
    end
end
