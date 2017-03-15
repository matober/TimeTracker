class Category < ApplicationRecord
  validates :c_name, presence: true, length: {minimum: 1}
  #has_many :activities
  #belongs_to :user, dependent: :destroy
end
