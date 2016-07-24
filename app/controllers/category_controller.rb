class CategoryController < ApplicationController
  before_action :initialize_products
  before_action :initialize_links

  private
def index
 if params[:category_id]
  #@category=  Category.find(params[:category_id])
  @products = Category.find(params[:category_id])
 
 end
end


  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
