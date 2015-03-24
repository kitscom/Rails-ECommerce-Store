class Product < ActiveRecord::Base
  mount_uploader :image, ProductUploader
  has_many :line_items
  has_many :orders, :through => :line_items
  validates :name, presence: true, uniqueness: true
end
