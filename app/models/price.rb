class Price < ApplicationRecord
  validates :price, presence: true
  validates :time, presence: true
  belongs_to :currency, :foreign_key => 'crypto_id'
end
