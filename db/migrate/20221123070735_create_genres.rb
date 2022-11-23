class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      
      #ジャンル名カラム
      t.string :name, null: false
      
      t.timestamps
    end
  end
end
