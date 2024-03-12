class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :name,                                       null: false
      t.text :explantion,                                   null: false
      t.integer :category_id,                               null: false
      t.integer :situation_id,                              null: false
      t.integer :delivery_charge_id,                        null: false
      t.integer :region_of_origin_id,                       null: false
      t.integer :number_of_days_until_shipping_id,          null: false
      t.integer :price,                                     null: false
      t.references :user,                                   null: false,foreign_key: true

      t.timestamps
    end
  end
end
