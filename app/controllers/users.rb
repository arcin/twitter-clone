get '/' do
  erb :index
end

post '/create' do
  User.create(username: params[:username],password: params[:password])
  redirect '/'
end