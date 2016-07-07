ActiveAdmin.register_page "Dashboard" do

  #menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

      content title: proc{ I18n.t("active_admin.dashboard") } do
        
        columns do
        
                column do
                  panel "Recent Orders" do
                    table_for Order.where(status: "pending").order('id desc') do
                      
                            column("Status") do |order| 
                              status_tag(order.status)
                            end
                            
                            column("Customer") do |order|
                              customer = Customer.find( order.customer_id)
                              if customer != nil
                                link_to(customer.email_address, admin_customer_path(customer))
                              end
                            end
                                        
                            column("Products") do |order|
                              #get all line-items on this order
                              #for each, get its product and add to a string:
                              #name = name + something
                              names=""
                              order.line_items.each do |item|
                                names = names + item.product.name
                              end
                           names
                              #also accumulate the price*quantity
                            end
                            
                            column("Total") do |order|
                              #the order has taxes. Get each tax and then apply to the total. It already has a total...
                              23.50*(1+(order.pst_rate||0))
                            end
                            
                    end
                  end
              end             
          
        end
       
      end 

end
