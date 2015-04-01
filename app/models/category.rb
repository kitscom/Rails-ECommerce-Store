class Category < ActiveRecord::Base
  has_many :products
  def index
    #@categories = Category.all
  end
end
