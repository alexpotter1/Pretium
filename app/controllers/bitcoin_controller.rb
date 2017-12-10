class BitcoinController < ApplicationController

  def initialize
    super
    @default_fiat = 'GBP'
    @currency = nil
    @prefs_controller = PreferencesController.new
  end

  def index
  end

end
