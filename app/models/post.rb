class Post < ActiveRecord::Base
  include Tweets
  extend FriendlyId
  
  # after_create :post_to_twitter
  
  friendly_id :title, use: :slugged
  validates :title, presence: true, uniqueness: true, on: :create, length: {in: 5..150}
  validates :category, presence: true, allow_blank: true
  validates :header_img_url, format: {with: /\.(png|jpg|gif)/, message: "only image url"}, allow_blank: true
  validates :body, presence: true, length: {in: 50..150000}
  validates :all_tags, presence: true, allow_blank: true, length: {in: 2..150}
  
  
  default_scope {order('created_at DESC')}
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  
  scope :published, -> {where(published: true)}
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end
  
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
  # sitepoint.com/tagging-scratch-rails/
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
 
  def all_tags
    self.tags.map(&:name).join(", ")
  end
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).posts.published
  end
  # end sitepoint.com/tagging-scratch-rails/
  
  private  
  def post_to_twitter
    tweet("#{title[0..120]} #{Bitly.client.shorten('http://www.google.com').short_url}")  #add a few tags later + replace google with real url
  end
  
end
