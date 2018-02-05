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

  def edit
    @photo = Photo.find params[:id]
    @products = products
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

  def update
    @photo = Photo.find params[:id]

    if @photo.update(photo_params)
      redirect_to @photo
    else
      @products = products
      render 'edit'
    end
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
