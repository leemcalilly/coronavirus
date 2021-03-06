class State < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :counties

  validates :fips, uniqueness: true
end
