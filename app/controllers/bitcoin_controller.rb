class BitcoinController < ApplicationController

  def initialize
    super
    @default_fiat = 'GBP'
    @prefs_controller = PreferencesController.new
    @currency_controller = CurrencyController.new(currency_type: 'BTC', @prefs_controller)
  end

  def index
  end

end
