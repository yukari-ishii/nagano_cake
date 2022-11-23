class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      #注文IDカラム
      t.integer :order_id, null: false
      #商品IDカラム
      t.integer :item_id, null: false
      #購入時価格カラム
      t.integer :price, null: false
      #数量カラム
      t.integer :amount, null: false
      #製造ステータスカラム
      t.integer :making_status, null: false, default: "0"
      
      t.timestamps
    end
  end
end
