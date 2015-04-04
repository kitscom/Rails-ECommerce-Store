class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(5)
    @page_title = 'Main page title'
    @pages = Category.all
    @links = ContentPage.all
    @hi=Category.all
    
    if session[:visit_count]
      @visit_count = session[:visit_count] + 1
    else
      @visit_count = 1
    end
    session[:visit_count] = @visit_count
    
  end

  def show
    @product = Product.find(params[:id])
    @page_title = 'Show page title'
  end

  def content_page
    @product = ContentPage.find(params[:id])
   
  end
  def category
    @page_title = 'Product By Category'
   # @pages = Category.all
    @products = Product.category.find(params[:id])
  # @products = Category.find(category_id:(params[:id]))
  end
  
  def search_results                    
    @page_title = 'Search Results'
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    @products = Product.where("name LIKE ?",wildcard_keywords)
  end
  
  def save_fav_product
    session[:favourite_product_id]= params[:id]
    redirect_to :back
  end
  
  def about_us
    
  end
  
  def contact_us
  
  end

  private

  def product_params
    params.require(:product).permit(:name, :price,
                                    :description, :image, stock_quantity,
                                    :category_id)
  end
end
