class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  
  validates :content, length: {maximum: 100}
end
