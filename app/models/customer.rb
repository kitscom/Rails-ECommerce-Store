class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders

  def to_s
    "#{first_name} #{last_name}"
  end
end
