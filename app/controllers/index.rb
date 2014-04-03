get '/' do
  erb :index
end

post '/create' do
  User.create(username: params[:username],password: params[:password])
  erb :index
end

post '/login' do
 @valid_user = User.authenticate(username: params[:username],password: params[:password])
 redirect '/' unless @valid_user
 session[:user_id] = @valid_user.id
  erb :index
end

