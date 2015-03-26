class ProvinceController < ApplicationController
  
  
  def index
    @provinces = Province.all
   # @current_time = Time.now
   # @gst = currency(Province.gst)
   
  end
  def currency (amount)
    sprintf("%.2f",amount)
  end
end
