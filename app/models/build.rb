class Build < ActiveRecord::Base
  validates :b_type, presence: true, inclusion: {in: %w(Mini Mid Pro Laptop), message: "the value is not allowed"}
  validates :name, presence: true, uniqueness: true, on: :create, length: {in: 3..50}
  validates :spec, presence: true, length: {in: 3..50}
  validates :mb, allow_blank: true, length: {in: 3..50}
  validates :cpu, allow_blank: true, length: {in: 3..50}
  validates :gpu, allow_blank: true, length: {in: 3..50}
  validates :ram, allow_blank: true, length: {in: 3..50}
  validates :disk, allow_blank: true, length: {in: 3..50}
  validates :chassis, allow_blank: true, length: {in: 3..50}
  validates :cost, presence: true, length: {in: 3..20}
  validates :os, presence: true, length: {in: 3..20}
  validates :im, presence: true, length: {in: 3..30}
  validates :status, presence: true, inclusion: {in: %w(other success warning), message: "the value is not allowed"}
  validates :body, presence: true, length: {in: 50..150000}
  
  scope :mini, -> {where('b_type = ?', "Mini")}
  scope :mid, -> {where('b_type = ?', "Mid")}
  scope :pro, -> {where('b_type = ?', "Pro")}
  scope :laptop, -> {where('b_type = ?', "Laptop")}
end
