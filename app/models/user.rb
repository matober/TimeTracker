class User < ApplicationRecord

  has_many :activities, dependent: :destroy
  has_many :categories, dependent: :destroy

  acts_as_authentic

    validates :first_name, presence: true, length: {minimum: 1}
    validates :last_name, presence: true, length: {minimum: 1}
    validates :email, presence: true, uniqueness: true, length: {minimum: 5}
    validates :password, :confirmation => true, length: {minimum: 4}
    validates :password_confirmation, presence: true

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

