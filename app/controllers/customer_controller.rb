class CustomerController < ApplicationController
  before_action :initialize_products
  before_action :initialize_links

  def create_customer
    @provinces = Province.all
    @customer = Customer.new

    session[:customer_id] = @customer.id

    if @customer.nil?
      @customer = Customer.create(customer_params)
      flash[:notice] = 'You were successfully added!'
    else
      @customer = Customer.find_by(email_address: params[:email_address])
    end
  end

  def preview
    @provinces = Province.all
    @customer = Customer.find(session[:customer_id])
    @province = Province.find(@customer.province_id)

    flash[:notice] = 'Thanks for being here!' unless @customer.present?
  end

  def customer_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :email_address,
      :province_id,
      :address,
      :city
      )
  end
end
