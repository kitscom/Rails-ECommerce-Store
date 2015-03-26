class AddColumnToProvince < ActiveRecord::Migration
  def change
    add_column :provinces, :qst, :decimal
  end
end
