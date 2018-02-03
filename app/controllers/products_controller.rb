class ProductsController < ApplicationController
  public_actions :index, :show

  def create
    @product = Product.new product_params

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
    @categories = Category.all
  end

  def new
    @product = Product.new
    @photo = @product.photos.build
  end

  def show
    @product = Product.find params[:id]
    @photo = params[:photo] ? Photo.find(params[:photo]) : @product.primary_photo
  end

  private

  def product_params
    params.require(:product).permit(
      :description,
      :name,
      :price,
      photos_attributes: [
        :description,
        :image
      ]
    ).to_h
  end
end
