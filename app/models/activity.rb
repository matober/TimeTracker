class Activity < ApplicationRecord
  validates :a_name, presence: true, length: {minimum: 1}
  belongs_to :category, optional: true, dependent: :destroy, foreign_key: "parent_id"
end
