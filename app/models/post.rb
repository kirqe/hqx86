class Post < ActiveRecord::Base
  include Tweets
  extend FriendlyId
  
  after_create :post_to_twitter
  
  friendly_id :title, use: :slugged
  validates :title, presence: true, uniqueness: true, on: :create, length: {in: 5..150}
  validates :category, presence: true, allow_blank: true
  validates :header_img_url, format: {with: /\.(png|jpg|gif)/, message: "only image url"}, allow_blank: true
  validates :body, presence: true, length: {in: 50..150000}
  
  default_scope {order('created_at DESC')}
  belongs_to :user
  belongs_to :category
  
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end
  
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
  private  
  def post_to_twitter
    tweet("#{title[0..120]} #{Bitly.client.shorten('http://www.google.com').short_url}")  #add a few tags later + replace google with real url
  end
  
end
