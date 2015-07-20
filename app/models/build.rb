class Build < ActiveRecord::Base
  extend FriendlyId
  friendly_id :spec, use: :slugged
  
  before_validation :default_name
  
  after_create :tweet_with_condition
  after_update :tweet_with_condition

  validates :b_type, presence: true, inclusion: {in: %w(mini mid pro laptop), message: "selecte your build type"}
  validates :name, allow_blank: true, presence: true, uniqueness: true, length: {in: 3..150}
  validates :spec, presence: true, length: {in: 3..150}
  validates :mb, allow_blank: true, length: {in: 3..150}
  validates :cpu, allow_blank: true, length: {in: 3..150}
  validates :gpu, allow_blank: true, length: {in: 3..150}
  validates :ram, allow_blank: true, length: {in: 3..150}
  validates :disk, allow_blank: true, length: {in: 3..150}
  validates :chassis, allow_blank: true, length: {in: 3..150}
  validates :cost, presence: true, length: {in: 3..20}
  validates :os, presence: true, length: {in: 3..20}
  validates :im, presence: true, length: {in: 3..30}
  validates :status, presence: true, inclusion: {in: %w(other success notice), message: "the value is not allowed"}
  validates :body, presence: true, length: {in: 50..150000}
  
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  
  default_scope {order('updated_at DESC')}
  scope :mini, -> { where('b_type = ?', "mini")}
  scope :mid, -> { where('b_type = ?', "mid")}
  scope :pro, -> { where('b_type = ?', "pro")}
  scope :laptop, -> { where('b_type = ?', "laptop")}
  scope :published, -> {where(published: true)}
  
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("spec LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end

  def should_generate_new_friendly_id?
    slug.blank? || spec_changed?
  end
  
  def self.get_builds(build_type)
    case build_type
    when "mini" then Build.published.mini
    when "mid" then Build.published.mid
    when "pro" then Build.published.pro
    when "laptop" then Build.published.laptop
    else Build.published
    end
  end

  private
  def default_name
    username = User.find(user_id).username
    self.name = "#{username}'s build [#{self.id}]" unless name.present?
  end
  
  
  def tweet_with_condition
    if tweeted_changed? && tweeted.present?
      post_to_twitter
    end 
  end 
  
  def post_to_twitter
    message = "[#{status.upcase}] #{name}: #{spec}"
    TwitterWorker.perform_async(message, self.slug)
  end
end
