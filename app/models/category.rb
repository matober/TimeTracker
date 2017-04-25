class Category < ApplicationRecord
  # requires category name
  validates :c_name, presence: true, length: {minimum: 1}

  # Dependencies
  has_many :activities, :dependent => :delete_all
  belongs_to :user

  #Below is the necessary associations to have nested categories
  #belongs_to :parent, class_name: 'Category'
  #has_many :child, class_name: 'Category'
end
