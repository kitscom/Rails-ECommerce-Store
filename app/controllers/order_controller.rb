class OrderController < ApplicationController
  def order_params
    params.require(:order).permit(:status, :pst_rate, customer_id )
  end
end
 