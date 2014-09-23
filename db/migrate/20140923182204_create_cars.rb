class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :user_id
      t.integer :type_id
      t.integer :age
      t.integer :mileage
      t.integer :brand_id
      t.integer :color_id

      t.timestamps
    end
  end
end
