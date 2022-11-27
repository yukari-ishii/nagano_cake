class Item < ApplicationRecord
  #画像の投稿
  has_one_attached :image
  #アソシエーション       
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
end
