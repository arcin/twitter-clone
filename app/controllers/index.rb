get '/' do
  erb :index
end

post '/profile' do
  User.create(username: params[:username],password: params[:password])
  erb :index
end

