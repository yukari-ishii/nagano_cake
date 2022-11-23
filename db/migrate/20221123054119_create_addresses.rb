class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      #会員IDカラム
      t.integer :customer_id, null: false
      #宛名、郵便番号、電話番号カラム
      t.string :name,        null: false
      t.string :postal_code, null: false
      t.string :address,     null: false
      
      t.timestamps
    end
  end
end
