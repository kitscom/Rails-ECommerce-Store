class CustomerController < ApplicationController 
  
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
         @provinces = Province.all
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,
                                     :address, :phone_number,:notes, :city, :province_id)
  end
end
 