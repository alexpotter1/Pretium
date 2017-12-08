class BitcoinPreference < ApplicationRecord
  validates :fiat_currency, presence: true
end
