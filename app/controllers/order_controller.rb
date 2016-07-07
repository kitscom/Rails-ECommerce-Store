class OrderController < ApplicationController
  before_action :initialize_products
  before_action :initialize_links

  def order_params
    params.require(:order).permit(
      :status, :pst_rate, :gst_rate,
      :hst_rate, customer_id
    )
  end
end
