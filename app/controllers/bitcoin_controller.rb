require 'cryptocompare'

class BitcoinController < ApplicationController

  def initialize
    # Create default BitcoinPreference model (if not exists), save defaults
    super
    @default_fiat = 'GBP'
    @crypto = 'BTC'
    @prefs = nil
    @btc = nil

    if Preference.where(id: 1).empty?
      @prefs = Preference.create(:fiat_currency => @default_fiat)
      @prefs.save
    else
      self.obtainPrefModelFromDB
    end

    if Bitcoin.where(id: 1).empty?
      @btc = Bitcoin.create
      @btc.save
    else
  end

  def updateBtcPrices
    
  end

  def obtainPrefModelFromDB
    @prefs = Preference.first
  end

  def obtainBtcModelFromDB
    @btc = Bitcoin.first
  end

  def index
    # update prices from cryptocompare, store in model
  end

end
