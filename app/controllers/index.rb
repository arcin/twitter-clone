<<<<<<< HEAD
get '/' do
  erb :index
end

post '/profile' do
  User.create(username: params[:username],password: params[:password])
  erb :index
end

=======

>>>>>>> 7e4bbd9dc7809319e703055c4b9de4b8aa836281
