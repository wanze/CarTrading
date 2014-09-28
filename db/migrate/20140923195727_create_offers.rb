class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :car_id
      t.datetime :start
      t.datetime :end
      t.float :price
      t.integer :minimum_step
      t.text :contact_details
      t.boolean :immutable

      t.timestamps
    end
  end
end
