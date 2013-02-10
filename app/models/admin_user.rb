require 'digest/sha1'
class AdminUser < ActiveRecord::Base
  attr_accessible :username, :email
  attr_accessor :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true,
                      length: { within: 7..25 },
                      uniqueness: true

  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: { with: EMAIL_REGEX }

  validates :password, length: { within: 8..25 }, on: :create

  before_save :create_hashed_password
  after_save :clear_password

  def self.authenticate(username="", password="")
    user = AdminUser.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private
    def create_hashed_password
      unless password.blank?
        self.salt = AdminUser.make_salt(username) if salt.blank?
        self.hashed_password = AdminUser.hash_with_salt(password, salt)
      end
    end

    def clear_password
      self.password = nil
    end
end
