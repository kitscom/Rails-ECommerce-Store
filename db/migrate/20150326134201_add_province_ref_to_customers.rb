class AddProvinceRefToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :province, index: true
    add_foreign_key :customers, :provinces
  end
end
