get '/' do
  erb :index
end

# restful convention is 'post users'. Rails labels the method create, but don't
# worry about that too much.
post '/create' do
  @user = User.new(username: params[:username],email: params[:email])
  @user.password = params[:password]
  # you should try to avoid banging methods, since a failure will kill your
  # program entirely. Instead, you should just use .save and bubble the errors
  # back to your user in a way that doesn't crash the server.
  @user.save!
  redirect '/'
end

get '/public/:user' do
  @user = User.find_by_username(params[:user])
  @current_user = User.find(session[:user_id])
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