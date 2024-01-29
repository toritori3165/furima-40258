class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,             null: false
      t.text :content,                 null: false
      t.integer :category_id ,         null: false
      t.integer :condition_id,         null: false
      t.integer :shipping_fee_id,      null: false
      t.integer :area_id,              null: false
      t.integer :shipping_to_date_id,  null: false
      t.integer :price,                null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
