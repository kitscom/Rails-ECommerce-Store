class AddProductRefToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :product, index: true
    add_foreign_key :line_items, :products
  end
end
