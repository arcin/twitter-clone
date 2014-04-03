class CreateFollowers < ActiveRecord::Migration
  def change
    create_table (:followers) do |col|
      col.belongs_to :user
      col.integer :follower_id
    end
  end
end
