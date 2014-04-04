post '/login' do
  @valid_user = User.authenticate(params[:username], params[:password])
  redirect '/' unless @valid_user
  session[:user_id] = @valid_user.id
  redirect "/#{params[:username]}"
end

post '/logout' do
  session.clear
  redirect '/'
end

get '/:username' do
  @retweets = {}
  @user = User.find_by_username(params[:username])

  @people_you_follow = @user.people_user_is_following
  @follower_tweets = find_tweets_based_off_users(@people_you_follow)


  @people_you_follow.each do |followee_id|
   @retweets[User.find(followee_id)] = Retweet.where("retweeter_id = ?", followee_id).map! {|retweet| Tweet.find(retweet.tweet)}
  end


  if session[:user_id] == @user.id
    erb :user_page
  else
    redirect "/public/#{params[:username]}"
  end
end