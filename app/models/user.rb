class User < ApplicationRecord



  class User < ActiveRecord::Base
    attr_accessor :email, :password, :password_confirmation
    has_many :activity


    before_save :encrypt_password
    before_save { self.email = email.downcase }

    #EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> cd84a5d73a4862dec852b95d742ee0061a298f2f
    validates :first_name, presence: true, length: {minimum: 1}
    validates :last_name, presence: true, length: {minimum: 1}
    validates :email, presence: true, uniqueness: true, length: {minimum: 5}
    validates :username, presence: true, uniqueness: true, length: {minimum: 1}
    validates :password_digest, length: {minimum: 6}
<<<<<<< HEAD
=======
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates :password, presence: true, length: {minimum: 6}
=======
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates :password, presense:true, length: {minimum: 6}
>>>>>>> cd84a5d73a4862dec852b95d742ee0061a298f2f
    validates_presence_of :email
    validates_uniqueness_of :email
    validates :email, length: {minimum: 5}

>>>>>>> refs/remotes/origin/dev

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
