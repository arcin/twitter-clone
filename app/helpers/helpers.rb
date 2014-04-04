helpers do
  def find_tweets_based_off_users(users)
    tweet_collection = []
    users.each do |user_id|
      user = User.find(user_id)
      user.tweets.map {|tweet| tweet_collection << tweet}
    end
    tweet_collection
  end

end