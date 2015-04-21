class CategoryController < ApplicationController
  before_action :initialize_products
  before_action :initialize_links

  private

  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
