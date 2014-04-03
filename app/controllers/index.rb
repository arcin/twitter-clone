get '/:username' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :user_page
  else
    redirect '/'
  end
end
