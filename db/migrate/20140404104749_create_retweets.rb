class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |col|
      col.belongs_to :tweet
      col.integer    :retweeter_id

      col.timestamps
    end
  end
end
