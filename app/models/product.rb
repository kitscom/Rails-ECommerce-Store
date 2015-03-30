class Product < ActiveRecord::Base
  mount_uploader :image, ProductUploader
  
  belongs_to :category
  has_many :line_items
  has_many :orders, :through => :line_items
  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ProductUploader
end
