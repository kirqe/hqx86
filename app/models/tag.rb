class Tag < ActiveRecord::Base
  
  validates :name, presence: true
  
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings
end
