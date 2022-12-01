class Order < ApplicationRecord
  #アソシエーション
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  ##enum定義
  #支払い方法
  enum payment_method: { credit_card: 0, transfer: 1 }
  #注文ステータス
  enum status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4 }
end
