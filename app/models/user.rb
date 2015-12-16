class User < ActiveRecord::Base
  acts_as_paranoid
  extend FriendlyId
  friendly_id :username, use: :slugged
  after_commit :expire_cache
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,  :async, :confirmable, :omniauthable, :omniauth_providers => [:facebook]
 
  validates :username, presence: true, uniqueness: true, length: {in: 3..50}
  validates :user_info, presence: true, allow_blank: true, length: {in: 1..500}
  validates :current_build, presence: true, allow_blank: true, length: {in: 5..200} 
  validates :contact_details, presence: true, allow_blank: true, length: {in: 1..200} 
  validates :user_info, presence: true, allow_blank: true, length: {in: 1..500} 
   
  has_many :builds#, dependent: :destroy
  has_many :posts#, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  default_scope {order('created_at DESC')}
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.username = auth.info.name
        user.password = Devise.friendly_token[0,20]
        user.skip_confirmation!
      end
  end
   
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