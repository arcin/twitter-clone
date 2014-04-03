class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |col|
      col.belongs_to :user_id
      col.string :text, :limit => 140

      col.timestamps
    end
  end
end
