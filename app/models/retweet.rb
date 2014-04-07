class Retweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tweet

  before_save :change_tweet_status

  # cool use of a before save status. well done.
  def change_tweet_status
    original_tweet = Tweet.find(self.tweet)
    original_tweet.retweet_status = true
  end
end
