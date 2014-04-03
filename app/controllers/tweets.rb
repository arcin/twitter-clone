# tweets routes
post '/tweet' do
  @tweet = Tweet.create(text: params[:text], user_id: session[:user_id])
  @user = User.find(session[:user_id])

  redirect "/public/#{@user.username}"
end