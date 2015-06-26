class Build < ActiveRecord::Base
  validates :b_type, presence: true, inclusion: {in: %w(mini mid pro laptop), message: "selecte your build type"}
  validates :name, presence: true, uniqueness: true, on: :create, length: {in: 3..150}
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
  has_many :comments, dependent: :destroy
  
  default_scope {order('updated_at DESC')}
  scope :mini, -> { where('b_type = ?', "mini")}
  scope :mid, -> { where('b_type = ?', "mid")}
  scope :pro, -> { where('b_type = ?', "pro")}
  scope :laptop, -> { where('b_type = ?', "laptop")}
  
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("spec LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end

end
