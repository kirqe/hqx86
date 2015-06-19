class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable# ,:omniauthable # ,
 #         omniauth_providers: [:github ]
 
  validates :username, presence: true, uniqueness: true, length: {in: 3..150}
  has_many :builds
  has_many :comments
  
end
