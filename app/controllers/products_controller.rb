class ProductsController < ApplicationController
  public_actions :index, :show

  def create
    @product = Product.new product_params

    if @product.save
      redirect_to @product
    else
      @categories = categories
      render 'new'
    end
  end

  def edit
    @product = Product.find params[:id]
    @categories = categories
  end

  def index
    @products = Product.all
    @categories = Category.all
  end

  def new
    @product = Product.new
    @photo = @product.photos.build
    @categories = categories
  end

  def show
    @product = Product.find params[:id]
    @photo = params[:photo] ? Photo.find(params[:photo]) : @product.primary_photo
  end

  def update
    @product = Product.find params[:id]

    if @product.update(product_params)
      redirect_to @product
    else
      @categories = categories
      render 'edit'
    end
  end

  private

  def categories
    Category.all
      .order(:name)
      .collect { |category| [category.name, category.id] }
  end

  def product_params
    params.require(:product).permit(
      :description,
      :name,
      :price,
      category_ids: [],
      photos_attributes: [
        :description,
        :image
      ]
    ).to_h
  end
end
