class User < ActiveRecord::Base
  has_many :followers
  has_many :tweets
  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    @user.password == password ? @user : nil
  end
end
