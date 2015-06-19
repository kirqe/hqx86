class Comment < ActiveRecord::Base
  validates :body, presence: true, length: 10..500
  
  belongs_to :user
  belongs_to :build
end
