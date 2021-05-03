class CreateLikedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :liked_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
