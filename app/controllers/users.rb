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