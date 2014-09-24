class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :offer_id
      t.integer :placed_by
      t.datetime :timestamp
      t.float :price

      t.timestamps
    end
  end
end
