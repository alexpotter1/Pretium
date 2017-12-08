class Preference < ApplicationRecord
  validates :fiat_currency, presence: true

  private
    def bitcoinpreference_params
      params.require(:bitcoin_preferences).permit(:fiat_currency)
    end
end
