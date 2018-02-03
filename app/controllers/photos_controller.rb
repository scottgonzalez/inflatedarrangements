class PhotosController < ApplicationController
  public_actions :index, :show

  def create
    @photo = Photo.new photo_params

    if @photo.save
      redirect_to @photo
    else
      @products = products
      render 'new'
    end
  end

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @products = products
  end

  def show
    @photo = Photo.find params[:id]
  end

  private

  def photo_params
    params.require(:photo).permit(
      :description,
      :image,
      product_ids: []
    ).to_h
  end

  def products
    Product.all
      .order(:name)
      .collect { |product| [product.name, product.id] }
  end
end
