class Activity < ApplicationRecord

  validates :a_name, presence: true, length: {minimum: 1}

 #belongs_to :user, dependent: destroy
  #belongs_to :category

  #accepts_nested_attributes_for :category

end
