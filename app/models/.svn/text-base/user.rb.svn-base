class User < ActiveRecord::Base
  require 'bcrypt'
  has_many :comments
  has_many :blogs
  validates :name,:email,:hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(self.hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(name, password)
    if user = self.find_by_name(name)
      user = nil if user.password != password
    end
    if user.nil?
      puts "User is nil"
    else
      puts "User not nil " + user.name + " - " + user.password
    end
    user
  end
end
