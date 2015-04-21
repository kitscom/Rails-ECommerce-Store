class ProvinceController < ApplicationController
  def index
    @provinces = Province.all
  end

  def province_params
    params.require(:province).permit(:name, :pst, :gst, :hst, :qst)
  end

  t.string 'name'
  t.decimal 'pst'
  t.decimal 'hst'
  t.datetime 'created_at', null: false
  t.datetime 'updated_at', null: false
  t.decimal 'qst'
end
