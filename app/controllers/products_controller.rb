class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find params[:id]
    @photo = params[:photo] ? Photo.find(params[:photo]) : @product.primary_photo
  end
end
