class BitcoinPrice < ApplicationRecord
  validates :price, presence: true
  validates :time, presence: true
end
