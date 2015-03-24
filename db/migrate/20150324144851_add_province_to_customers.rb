class AddProvinceToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :province, :string
  end
end
