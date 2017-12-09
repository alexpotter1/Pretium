class Price < ApplicationRecord
  validates :price, presence: true
  validates :time, presence: true
  belongs_to :bitcoin
end
