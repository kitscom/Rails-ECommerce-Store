class ProductsController < ApplicationController
  def index
   @products = Product.all.page(params[:page]).per(10)
   @page_title = "Main page title"
   #render :index - default
  end  
  def currency (amount)
    sprintf("$%.2f",amount)
  end  
  def show
    @product = Product.find (params[:id])
    @page_title = "Show page title"
  end
  def category(args)
    #@products = Product.category(:name, :description)
  end
  #def new
  # # render text: "for testing purposes"
  # @product = Product.new
  #end  
  ##no associated view required
  #def create
  # @product = Product.new(product_params)   
  # if (@product.save)
  #   redirect_to @product
  # else
  # render:new
  # end 
  #end  
  #def edit
  #  @product = Product.find (params[:id])           
  #end  
  #def update
  #  @product = Product.find(params[:id])
  #  if (@product.update_attributes(product_params))
  #    redirect_to @product
  #  else
  #    render :edit      
  #  end 
  #end  
  #def destroy
  #  @product = Product.find (params[:id])
  #  @product.destroy
  #  redirect_to root_path
  #end  
  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :image, stock_quantity, :category_id)
  end
end