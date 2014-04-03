class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |col|
      col.integer :user_id
      col.integer :follower_id
    end
  end
end
