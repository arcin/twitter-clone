class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |col|
      col.belongs_to :user
      col.string :text, :limit => 140
      col.boolean :retweet_status

      col.timestamps
    end
  end
end
