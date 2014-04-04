get '/' do
  erb :index
end

post '/create' do
  User.create(username: params[:username],password: params[:password])
  redirect '/'
end

get '/public/:user' do
  @user = User.find_by_username(params[:user])
  erb :public_profile
end

post '/follow/:username' do
  @user = User.find_by_username(params[:username])
  @follower = User.find(session[:user_id])

  Follower.create(user_id: @user.id, follower_id: @follower.id)
  redirect "/#{@follower.username}"
end

post '/public_profile' do
  @users = params[:username]
  redirect "/public/#{@users}"
end