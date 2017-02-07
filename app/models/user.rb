class User < ApplicationRecord

  attr_accessor :password
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, length: { minimum: 5}
  validates :password, :confirmation => true
  validates_length_of :password, minimum: 5, :on => create

  has_secure_password



end
