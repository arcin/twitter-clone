# tweets routes
post '/tweet' do
  @tweet = Tweet.create(text: params[:text], user_id: session[:user_id])
  @user = User.find(session[:user_id])

  redirect "/public/#{@user.username}"
end


get '/retweet/:tweet_id' do
  @original_tweeter = Tweet.find_by_text(params[:tweet_id]).user_id
  Retweet.create(tweet_id: @original_tweeter, retweeter_id: session[:user_id])
  redirect "/"
end