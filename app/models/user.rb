class User < ApplicationRecord

  has_many :activities, dependent: :destroy
  has_many :categories, dependent: :destroy

  attr_accessor :password_confirmation

  acts_as_authentic do |config|
    config.validate_password_field = false
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, :confirmation => true, length: {minimum: 4}
  validates :password_confirmation, length: {minimum:4}

  # def self.authenticate(email, password)
  #   user = find_by_email(email)
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user
  #   else
  #     nil
  #   end
  # end
  #
  # def encrypt_password
  #   if password.present?
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end

  def deliver_password_reset_instructions
    reset_perishable_token!
    PasswordResetMailer.reset_email(self).deliver_now
  end
end

