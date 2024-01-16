require 'bcrypt'

class User
  attr_accessor :username, :password

  @@users = []

  def initialize(username, password)
    @username = username
    @password = BCrypt::Password.create(password)

    @@users << self
  end

  def self.all
    @@users
  end

  # authenticate user to login

  def self.authenticate(username, _password)
    user = User.find_by_username(username)
  end

  def self.find_by_username(username)
    user = all.find do |user|
      user.username == username
    end
  end
end
