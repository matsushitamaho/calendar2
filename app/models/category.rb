class Category < ApplicationRecord
  has_many :blogs, class_name: 'Blog', foreign_key: 'category_id'
  
  validates :name, presence: true
end
