class Activity < ApplicationRecord

  validates :a_name, presence: true, length: {minimum: 1}

  belongs_to :user
  belongs_to :category, optional: true
  #accepts_nested_attributes_for :category

end
