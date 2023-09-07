class Blog < ApplicationRecord
  belongs_to :category
  
  validates :title,       presence: true
  validates :content,     presence: true
  validates :start_time,  presence: true
  validates :category_id, presence: true
end
