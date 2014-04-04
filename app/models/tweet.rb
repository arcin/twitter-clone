class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_many :retweets
  belongs_to :user
end
