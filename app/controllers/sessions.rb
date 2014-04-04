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
  @user = User.find_by_username(params[:username])
  @current_user = User.find(session[:user_id])
  @people_being_followed = @user.people_user_is_following
  @tweets = find_tweets_based_off_users(@people_being_followed)
  if session[:user_id] == @user.id
    erb :user_page
  else
    redirect "/public/#{params[:username]}"
  end
end