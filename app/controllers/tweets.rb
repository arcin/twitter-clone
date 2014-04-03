# tweets routes
post '/tweet' do
  @tweet = Tweet.create(text: params[:text], user_id: session[:user_id])
end