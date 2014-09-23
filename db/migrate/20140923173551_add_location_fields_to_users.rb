class AddLocationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plz, :integer
    add_column :users, :street, :string
    add_column :users, :city, :string
  end
end
