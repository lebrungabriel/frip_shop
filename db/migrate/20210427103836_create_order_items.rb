class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :price
      t.integer :quantity
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
