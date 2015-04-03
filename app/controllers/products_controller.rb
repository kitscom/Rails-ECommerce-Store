class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(5)
    @page_title = 'Main page title'
  end

  def show
    @product = Product.find(params[:id])
    @page_title = 'Show page title'
  end

  def category
    @page_title = 'Product By Category'
    #@products = Product.category(params[:id])
   @products = Product.category.where(category_id:(params[:id]))
  end
  def search_results                    
    @page_title = 'Search Results'
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    @products = Product.where("name LIKE ?",wildcard_keywords)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price,
                                    :description, :image, stock_quantity,
                                    :category_id)
  end
end
