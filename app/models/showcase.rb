class Showcase < ActiveRecord::Base
  extend FriendlyId

  paginates_per 12

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  friendly_id :name, use: :slugged

  URL_REGEX = /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i

  validates :name, presence: true, length: {in: 2..150}, uniqueness: true
  validates :header_img_url, format: {with: /\.(png|jpg|gif)/, message: "only image url"}, presence: true
  validates :album_url, format: {with:  URL_REGEX, message: "the url is invalid"}, allow_blank: true
  validates :description, presence: true, length: {in: 2..1000}, allow_blank: true

  def expire_cache
    Rails.cache.delete([self.class.name, id])
  end

  def cached_comments
    Rails.cache.fetch([self, "comments"]){ comments.to_a }
  end
end