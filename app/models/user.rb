class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  after_commit :expire_cache
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :async, :confirmable# ,:omniauthable # ,
 #         omniauth_providers: [:github ]
 
  validates :username, presence: true, uniqueness: true, length: {in: 3..150}
  validates :user_info, presence: true, allow_blank: true, length: {in: 1..500}
  validates :current_build, presence: true, allow_blank: true, length: {in: 5..200} 
  validates :contact_details, presence: true, allow_blank: true, length: {in: 1..200} 
  validates :user_info, presence: true, allow_blank: true, length: {in: 1..500} 
   
  has_many :builds
  has_many :posts
  has_many :comments, dependent: :destroy
  
  default_scope {order('created_at DESC')}
  
  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end
  
  def self.cached_find(id)
    Rails.cache.fetch([name, id], expires_in: 5.minutes){ find(id) }
  end
  
  def expire_cache
    Rails.cache.delete([self.class.name, id])
  end
  
end