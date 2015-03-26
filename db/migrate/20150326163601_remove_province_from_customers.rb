class RemoveProvinceFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :province, :string
  end
end
