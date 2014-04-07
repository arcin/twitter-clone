post '/login' do
  # there's no reason to use instance variables if you aren't passing them to
  # a rendered page. Scope as locally as possible!
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
  # any reason this is in the sessions controller? separating files is valuable,
  # but it can get confusing once you start throwing stuff into random files
  @retweets = {}
  @user = User.find_by_username(params[:username])

  @people_you_follow = @user.people_user_is_following
  @follower_tweets = find_tweets_based_off_users(@people_you_follow)

  # this is a lot of logic! and logic that should probably be done in the model!
  # if you have associations set up between retweets and tweets, you may be able
  # to handle much of this through the built has_many/belongs_to methods.
  @people_you_follow.each do |followee_id|
   @retweets[User.find(followee_id)] = Retweet.where("retweeter_id = ?", followee_id).map! {|retweet| Tweet.find(retweet.tweet)}
  end


  if session[:user_id] == @user.id
    erb :user_page
  else
    redirect "/public/#{params[:username]}"
  end
end