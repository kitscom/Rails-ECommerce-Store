class ProductsController < ApplicationController
  before_filter :initialize_products 
  #around_action :radio_results, only: :radio_results
  def index
    @products = Product.all.order("name DESC").page(params[:page]).per(5)
    
    
    #@products = Product.order("id DESC").page(page).per(50)
    @page_title = 'Main page title'
    @pages = Category.all.order("name Desc")
    @links = ContentPage.all
    @new = Product.status("New").order("name")
   # @status = @status.status(params[:status]) if params[:status].present?
    
    if session[:visit_count]
      @visit_count = session[:visit_count] + 1
    else
      @visit_count = 1
    end
    session[:visit_count] = @visit_count
    
    # @status = Product.where(nil)
    #filtering_params(params).each do |key, value|
    #@products = @products.public_send(key, value) if value.present?
     #end
    
  end

  def show
    @product = Product.find(params[:id])
    @page_title = 'Show page title'
     @pages = Category.all.order("name")
    @links = ContentPage.all
  end

  def content_page
    @page = ContentPage.find(params[:id])
    @pages = Category.all
    @links = ContentPage.all
   
   
  end
  def category
    @page_title = 'Product By Category'
    @pages = Category.all.order('name desc')
    @links = ContentPage.all
    @products = Category.find(params[:id]).products
  # @products = Product.where(category_id:(params[:id]))
end
 def order
    @order = Order.all
  @pages = Category.all
    @links = ContentPage.all
   
  end
  
  def search_results
     #query = "%#{search}%"
    @page_title = 'Search Results'
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    where_category = ' '
    if params[:category_id].to_i != -1
      where_category = ' AND category_id = ' + params[:category_id]
    end
    
    @products = Product.where('name LIKE ? OR description LIKE ? '+ where_category, wildcard_keywords, wildcard_keywords)
    @pages = Category.all
    @links = ContentPage.all
    #@new = Product.status("New")
  
  end
  
  def radio_results
   @new = Product.status("New")
   @sale = Product.status("On Sale")
   @pages = Category.all
   @links = ContentPage.all
  
  end
 
  #def radio_button(method, tag_value, options = {})
  #  @template.radio_button(@object_name, method, tag_value, objectify_options(options))
  #end
  
  #def search_category
  #  @products = Category.new
  #end
  def save_fav_product
    session[:favourite_product_id]= params[:id]
    redirect_to :back
  end
  def forget_me_bro
   session[:visit_count]=nil
   session[:products]= nil
   redirect_to  :action => :index
  end
  
  def add_to_cart
    id = params[:id].to_i
    session[:products] ||=[] #default to empty array[]
    session[:products] << id
    #session[:products] << id  unless session[:products].include?(id)
    redirect_to :action => :index
  end
 
  
  def remove_from_cart
      id = params[:id].to_i
      session[:products].delete(id)
      redirect_to :action => :index
    
  end
  
  
  #def about_us
  #  
  #end
  #
  #def contact_us
  #
  #end
  
  def charge
   
    # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to products_path
end
  
  
protected
  def initialize_products
    session[:products] ||=[]
    @cart_products = []
    session[:products].each {|id| @cart_products << Product.find(id)}
  end
  private

  def product_params
    params.require(:product).permit(:name, :price,
                                    :description, :image, stock_quantity,
                                    :category_id, :status)
  end
  

  ## A list of the param names that can be used for filtering the Product list
  #def filtering_params(params)
  #  params.slice(:status, :location, :starts_with)
  #end
end
