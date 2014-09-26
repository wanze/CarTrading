class CreateBidSettings < ActiveRecord::Migration
  def change
    create_table :bid_settings do |t|
      t.integer :offer_id
      t.integer :user_id
      t.boolean :automatic
      t.float :max_amount

      t.timestamps
    end
  end
end
