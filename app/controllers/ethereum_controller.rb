class EthereumController < ApplicationController

  def initialize
    super
    @default_fiat = 'GBP'
    @prefs_controller = PreferencesController.new
    @currency_controller = CurrencyController.new(currency_type: 'ETH', @prefs_controller)
  end

  def index
  end

end
