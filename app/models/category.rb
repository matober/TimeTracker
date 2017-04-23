class Category < ApplicationRecord
  validates :c_name, presence: true, length: {minimum: 1}
  has_many :activities, :dependent => :delete_all
  belongs_to :user
end
