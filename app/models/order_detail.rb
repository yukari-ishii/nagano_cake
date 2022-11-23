class OrderDetail < ApplicationRecord
  #アソシエーション
  belongs_to :item
  belongs_to :order
end
