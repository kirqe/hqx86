class Comment < ActiveRecord::Base
  validates :body, presence: true, length: 5..500
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
