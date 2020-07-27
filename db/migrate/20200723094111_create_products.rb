class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user, null:false
      t.string :name, null:false
      t.string :price, null:false
      t.text :text
      t.integer :status_id, null:false
      t.string :size
      t.integer :prefecture_id, null:false
      t.integer :delivery_id, null:false
      t.string :delivery_time, null:false
      t.integer :brand_id, null:false
      t.references :buy_user, foreign_key: { to_table: :users }
      t.integer :category_id, null:false
      t.timestamps
    end    
  end
end
