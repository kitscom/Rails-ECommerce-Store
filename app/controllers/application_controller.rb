class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def initialize_links
    @pages = Category.all.order('name Desc')
    @links = ContentPage.all
    #@links.each {|e| if(e.description == "About us") e.description="About Us" }
  end

  def initialize_products
    session[:products]  ||= []
    @cart_products = []
    session[:products].each { |id| @cart_products << Product.find(id) }
  end
end
