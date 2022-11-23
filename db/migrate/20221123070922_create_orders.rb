class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      #会員IDカラム
      t.integer :customer_id, null: false
      #配送先郵便番号・住所・宛名カラム
      t.string :postal_code, null: false
      t.string :address,     null: false
      t.string :name,        null: false
      #送料カラム
      t.integer :shipping_cost, null: false
      #請求額カラム
      t.integer :total_payment, null: false
      #支払方法カラム
      t.integer :payment_method, null: false, default: "0"
      #注文ステータスカラム
      t.integer :status, null: false, default: "0"
      
      t.timestamps
    end
  end
end
