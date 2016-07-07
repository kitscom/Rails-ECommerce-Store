class CustomerController < ApplicationController
  before_action :initialize_products
  before_action :initialize_links

  def index
    @provinces = Province.all
    render 'create_customer'
    #flash[:notice] = 'Thanks for being here!'
  end

  def create_customer
    @provinces = Province.all
    @customer = Customer.find_by(email_address: params[:email_address])

    if @customer.nil?
      @customer = Customer.create(customer_params)
      flash[:notice] = 'Thanks for Registering!'
    else
      flash[:notice] = 'Welcome back!'
    end
    session[:customer_id] = @customer.id
  end

  def preview
    create_customer
    @customer = Customer.find(session[:customer_id])
    @province = Province.find(@customer.province_id)
  end

  def qty
    @customer = Customer.find(session[:customer_id])
    @province = Province.find(@customer.province_id)
    @order = create_order
    @line_items = []

    @cart_products.each do |product|
    @line_items << create_line_item(product)
    end
  end

  def create_line_item(product)
    line_item_args =
      {
        'quantity' => params[:quantity],
        'price' => product.price,
        'product_id' => product.id,
        'order_id' => @order.id
      }
    LineItem.create(line_item_args)
  end

  def create_order
    order_data =
    {
      'status' => 'pending',
      'pst_rate' => @province.pst,
      'gst_rate' => @province.gst,
      'hst_rate' => @province.hst,
      'customer_id' => @customer.id
    }
    Order.create(order_data)
  end

  def customer_params
    {
      'first_name' => params.require(:first_name),
      'last_name' => params.require(:last_name),
      'email_address' => params.require(:email_address),
      'province_id' => params.require(:province_id),
      'address' => params.require(:address),
      'city' => params.require(:city)
    }
  end
end
