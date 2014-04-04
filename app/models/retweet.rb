class Retweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tweet
end
