class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null:false,
      t.integer :password
      t.intodaction :text
      t.first_name :string
      t.last_name :string
      t.first_name_kana :string
      t.last_name_kana :string
      t.barthday :string
      t.e_mail :string
      t.timestamps
    end
  end
end
