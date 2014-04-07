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
    # you're bringing back the entire followers table and filtering it in ruby.
    # that's bad! you should let active record handle as much fo this as possible.
    # user.followers is built in, and should get you the exact same structure.
    Follower.all.each do |row|
      if row.follower_id.to_i == self.id.to_i
        @people << row.user_id.to_i
      end
    end
      @people
  end

  def is_following?(person_of_interest)
    # where statements are considered ugly by some. I'd suggest attempting to do
    # this using more of the built in ActiveRecord query interface, something like:
    #
    # self.followers.include?(person_of_interest)
    #
    relationship = Follower.where("user_id = ? AND follower_id = ?", person_of_interest.id, self.id)
    if relationship == []
      false
    else
      true
    end

  end
end
