class Activity < ApplicationRecord
  # Activity must contain name
  validates :a_name, presence: true, length: {minimum: 1}

  #Set sortable position in ascending order
  default_scope { order("priority ASC") }

  # Dependencies
  belongs_to :user
  belongs_to :category, optional: true
end
