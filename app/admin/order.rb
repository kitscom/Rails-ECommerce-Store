ActiveAdmin.register Order do


 permit_params :status, :pst_rate, :gst_rate,
                            :hst_rate, :customer_id 
  
end

ActiveAdmin.register LineItem do
  belongs_to :order
  
end
