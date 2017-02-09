class Activity < ApplicationRecord

  validates :a_name, presence: true, length: {minimum: 1}
end
