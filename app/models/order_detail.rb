class OrderDetail < ApplicationRecord
  #アソシエーション
  belongs_to :item
  belongs_to :order
  
  ##enum定義
  #製作ステータス
  enum making_status: { impossible_making: 0, waiting_making: 1, making: 2, finish: 3 }
end
