class Item < ApplicationRecord
  #画像の投稿
  has_one_attached :image
  #アソシエーション
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
      image
  end

  #単価（税込）を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end

end
