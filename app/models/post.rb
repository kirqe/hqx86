class Post < ActiveRecord::Base
  extend FriendlyId

  paginates_per 9

  after_create :tweet_with_condition
  after_update :tweet_with_condition
  after_commit :expire_cache

  friendly_id :title, use: :slugged
  validates :title, presence: true, uniqueness: true, on: :create, length: {in: 5..150}
  validates :slug, uniqueness: true
  validates :category, presence: true, allow_blank: true
  validates :header_img_url, format: {with: /\.(png|jpg|gif)/, message: "only image url"}, allow_blank: true
  validates :body, presence: true, length: {in: 50..150000}
  validates :all_tags, presence: true, allow_blank: true, length: {in: 2..150}

  default_scope {order('created_at DESC')}
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  scope :published, -> {where(published: true)}


  def user
    User.unscoped {super}
  end

  def category
    Category.unscoped {super}
  end

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


  #caching
  def expire_cache
    Rails.cache.delete([self.class.name, id])
  end

  def cached_comments
    Rails.cache.fetch([self, "comments"]){ comments.to_a }
  end

  def cached_tags
    Rails.cache.fetch([self, "all_tags"]) { all_tags }
  end

  def cached_category
    Rails.cache.fetch([self, "category"]){ category.try(:name) }
  end
  #end caching

  private

  def tweet_with_condition
    if tweeted_changed? && tweeted.present?
      post_to_twitter
    end
  end

  def post_to_twitter
    message = "#{self.title[0..120]}"
    TwitterWorker.perform_async(message, self.slug, self.class.to_s.underscore)
  end

end
