class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, uniqueness: true
  has_many :tweets

  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    @user.password == password ? @user : nil
  end
end
