class Category < ActiveRecord::Base
  has_many :products
  def index
  end
end
