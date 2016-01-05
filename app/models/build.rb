class Build < ActiveRecord::Base
  extend FriendlyId
  friendly_id :spec, use: :slugged
  paginates_per 20
  searchkick autocomplete: ['title'] 
  before_validation :default_name
  
  after_create :tweet_with_condition
  after_update :tweet_with_condition
  after_commit :expire_cache

  URL_REGEX = /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i
  
  validates :b_type, presence: true, inclusion: {in: %w(mini mid pro laptop), message: "select build type"}
  validates :name, allow_blank: true, presence: true, uniqueness: true, length: {in: 3..150}
  validates :spec, presence: true, length: {in: 3..150}
  validates :slug, uniqueness: true
  validates :mb, allow_blank: true, length: {in: 3..150, message: "is too short"}
  validates :cpu, allow_blank: true, length: {in: 3..150, message: "is too short"}
  validates :gpu, allow_blank: true, length: {in: 3..150, message: "is too short"}
  validates :ram, allow_blank: true, length: {in: 3..150, message: "is too short"}
  validates :disk, allow_blank: true, length: {in: 3..150, message: "is too short"}
  validates :chassis, allow_blank: true, length: {in: 3..150, message: "is too short"}
  validates :cost, presence: true, length: {in: 3..20}, :numericality => { :greater_than_or_equal_to => 0 }
  validates :os, presence: true, length: {in: 2..50}
  validates :im, presence: true, length: {in: 2..50}
  validates :status, presence: true, inclusion: {in: %w(other success notice problem), message: "select build status"}
  validates :body, presence: true, length: {in: 50..150000, message: "is too short"}
  validates :other_hw, allow_blank: true, length: {in: 3..3000}

  validates :mb_url, :cpu_url, :gpu_url, :ram_url, :disk_url, :chassis_url, format: {with: URL_REGEX, message: " is invalid"}, length:{in: 3..500, message: "is too short"}, allow_blank: true



  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  
  default_scope {order('created_at DESC')}
  scope :mini, -> { where('b_type = ?', "mini")}
  scope :mid, -> { where('b_type = ?', "mid")}
  scope :pro, -> { where('b_type = ?', "pro")}
  scope :laptop, -> { where('b_type = ?', "laptop")}
  scope :published, -> {where(published: true)}
  
  def user
    User.unscoped {super}
  end
  
  def search_data
    {
      title: title,
      name: name,
      spec: spec,
      b_type: b_type
    }
  end
  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  #   where("spec LIKE ?", "%#{search}%")
  #   where("body LIKE ?", "%#{search}%")
  # end

  def should_generate_new_friendly_id?
    slug.blank? || spec_changed?
  end
  
  def self.get_builds(build_type)
    case build_type
    when "mini" then published.mini
    when "mid" then published.mid
    when "pro" then published.pro
    when "laptop" then published.laptop
    else published
    end
  end
  
  def title
    "#{name}: #{spec}"
  end
  
  #caching
  # def self.cached_find(id)
  #   Rails.cache.fetch([name, id], expires_in: 5.minutes){ find(id) }
  # end
  
  def expire_cache
    Rails.cache.delete([self.class.name, id])
  end
  
  def cached_comments
    Rails.cache.fetch([self, "comments"]){ comments.to_a }
  end
  #end caching
  
  private
  def default_name
    username = User.find(user_id).username
    self.name = "#{username}'s build #{self.id}" unless name.present?
  end
  
  
  def tweet_with_condition
    if tweeted_changed? && tweeted.present?
      post_to_twitter
    end 
  end 
  
  def post_to_twitter
    message = "[#{status.upcase}] #{name}: #{spec}"
    TwitterWorker.perform_async(message, self.slug, self.class.to_s.underscore)
  end
end
