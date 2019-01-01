class Agents < ActiveRecord::Migration
  def up
    create_table :agents do |t|
      t.string :username
      t.string :password
      t.string :broker
    end
  end
  
  def down
    drop_table :agents
  end
end
