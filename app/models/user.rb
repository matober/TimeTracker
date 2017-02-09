class User < ApplicationRecord

    before_save { self.email = email.downcase }
    #EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :first_name, presence: true, length: {minimum: 1}
    validates :last_name, presence: true, length: {minimum: 1}
    validates :email, presence: true, uniqueness: true, length: {minimum: 5}
    validates :username, presence: true, uniqueness: true, length: {minimum: 1}
    validates :password_digest, length: {minimum: 6}

  has_secure_password

end
