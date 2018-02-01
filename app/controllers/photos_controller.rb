class PhotosController < ApplicationController
  public_actions :index, :show

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find params[:id]
  end
end
