class Activity < ApplicationRecord


  validates :a_name, presence: true, length: {minimum: 1}

  #belongs_to :user, dependent: destroy
end
