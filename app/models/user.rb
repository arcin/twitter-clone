require 'bcrypt'

class User < ActiveRecord::Base

  has_many :followers
  has_many :tweets
  validates :username, uniqueness: true

  include Gravtastic
  gravtastic  :secure => true,
              :filetype => :gif,
              :size => 120
  is_gravtastic!

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    @user.password == password ? @user : nil
  end


  def people_user_is_following
    @people = []
    Follower.all.each do |row|
      if row.follower_id.to_i == self.id.to_i
        @people << row.user_id.to_i
      end
    end
      @people
  end
end
