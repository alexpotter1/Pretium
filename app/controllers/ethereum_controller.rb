class EthereumController < ApplicationController

  def initialize
    super
    @default_fiat = 'GBP'
    @currency_controller = CurrencyController.new(currency_type: 'ETH')
    @prefs_controller = PreferencesController.new
  end

  def index
  end

end
