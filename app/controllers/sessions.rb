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
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :user_page
  else
    redirect '/'
  end
end