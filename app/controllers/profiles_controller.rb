class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user
      @posts = @user.posts.all
      render :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end