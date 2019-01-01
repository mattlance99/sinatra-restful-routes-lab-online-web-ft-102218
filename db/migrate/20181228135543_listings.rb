class Listings < ActiveRecord::Migration
  def up
    create_table :listings do |t|
      t.string :address
      t.integer :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :agent_id
    end
  end
  
  def down
    drop_table :listings
  end
end
