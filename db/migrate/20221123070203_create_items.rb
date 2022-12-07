class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      #ジャンルIDカラム
      t.integer :genre_id, null: false
      #商品名カラム
      t.string :name, null: false
      #商品説明文カラム
      t.text :introduction, null: false
      #税抜き価格カラム
      t.integer :price, null: false
      #販売ステータスカラム
      t.boolean :is_active, null: false, default: "true"
      
      t.timestamps
    end
  end
end
