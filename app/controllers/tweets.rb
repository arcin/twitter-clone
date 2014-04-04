# tweets routes
post '/tweet' do
  @tweet = Tweet.create(text: params[:text], user_id: session[:user_id])
  @user = User.find(session[:user_id])

  redirect "/public/#{@user.username}"
end


get '/retweet/:tweet_id' do
  @tweet = Tweet.find(params[:tweet_id])
  # @original_tweeter = User.find(@tweet.user_id)
  Retweet.create(tweet_id: @tweet.id, retweeter_id: session[:user_id])
  redirect "/"
end