class User < ActiveRecord::Base
 def self.authenticate(username,password)
  @user = User.find_by_username(username)
  @user.password == password

 end

end
