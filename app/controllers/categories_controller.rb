class CategoriesController < ApplicationController
  public_actions :index, :show

  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find params[:id]
    @other_categories = Category.where.not(id: params[:id]).sort_by(&:name)
  end
end
