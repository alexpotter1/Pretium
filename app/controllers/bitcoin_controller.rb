require 'cryptocompare'

class BitcoinController < ApplicationController

  def initialize
    # Create default BitcoinPreference model (if not exists), save defaults
    super
    @default_fiat = 'GBP'
    @crypto = 'BTC'
    @prefs = nil

    if BitcoinPreference.where(id: 1).empty?
      @prefs = BitcoinPreference.create(:fiat_currency => @default_fiat)
      @prefs.save
    else
      self.obtainModelFromDB
    end
  end

  def obtainModelFromDB
    @prefs = BitcoinPreference.first
  end

  def index
  end

end
