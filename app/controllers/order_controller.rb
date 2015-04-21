class OrderController < ApplicationController
  def create_order
    @customer = Customer.find(session[:customer_id])
    @province = Province.find(@customer.province_id)
    order_data = {
      'status' => 'pending', 'pst_rate' => @province.pst,
      'gst_rate' => @province.gst,
      'hst_rate' => @province.hst,
      'customer_id' => @customer.id
    }
    @order = Order.create(order_data)
  end

  def order_params
    params.require(:order).permit(:status, :pst_rate, customer_id)
  end
end
