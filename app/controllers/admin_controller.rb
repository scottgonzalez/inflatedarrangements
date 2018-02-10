class AdminController < ApplicationController
  def index
    @categories = Category.all.order(:name)
    @customer_messages = CustomerMessage.all.order(created_at: :desc)
    @products = Product.all.order(:name)
    @photo_count = Photo.count
  end
end
