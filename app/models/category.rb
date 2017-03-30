class Category < ApplicationRecord
  validates :c_name, presence: true, length: {minimum: 1}
  has_many :activities, dependent: :destroy, foreign_key: "parent_id" #if category is deleted, then all activities associated with it should be deleted
  belongs_to :user, dependent: :destroy
end
