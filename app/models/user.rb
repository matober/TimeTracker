class User < ApplicationRecord

  has_many :activities
  attr_accessor :email, :password, :password_confirmation

  class User < ActiveRecord::Base


    before_save :encrypt_password
    before_save { self.email = email.downcase }

    #EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


    validates :first_name, presence: true, length: {minimum: 1}
    validates :last_name, presence: true, length: {minimum: 1}
    validates :email, presence: true, uniqueness: true, length: {minimum: 5}
    validates :username, presence: true, uniqueness: true, length: {minimum: 1}
    validates :password_digest, length: {minimum: 6}
    validates :password, length: {minimum: 4}

    #-----------------------New Stuff ---------------------------------------
    acts_as_authentic do |c|
      c.crypto_provider = Authlogic::CryptoProviders::Sha512
    end
    #------------------------------------------------------------------------

    #---------------Unsure if working--------------
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :email
    validates_uniqueness_of :email
    #----------------------------------------------

    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
  end
end
