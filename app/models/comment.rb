class Comment < ActiveRecord::Base
  validates :body, presence: true, length: 2..1000

  belongs_to :commentable, polymorphic: true, touch: true
  belongs_to :user
end
