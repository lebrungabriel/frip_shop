class ChangeGenderColumnInProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :gender
    add_column :products, :gender, :integer
  end
end
