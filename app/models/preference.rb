class Preference < ApplicationRecord
  validates :fiat_currency, presence: true
  validates :time_interval, presence: true

  private
    def preference_params
      params.require(:preferences).permit(:fiat_currency, :time_interval)
    end
end
