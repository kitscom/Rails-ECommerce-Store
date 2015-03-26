class AddProvinceRefToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :province, index: true, :after => :username
    add_foreign_key :customers, :provinces
  end
end
