class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :color
      t.string :materials
      t.string :dimensions
      t.integer :category_id

      t.timestamps
    end
  end
end
