class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable# ,:omniauthable # ,
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
  
end