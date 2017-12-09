require 'cryptocompare'

class BitcoinController < ApplicationController

  def initialize
    # Create default BitcoinPreference model (if not exists), save defaults
    super
    @default_fiat = 'GBP'
    @prefs = nil
    @currency = nil

    if Preference.where(id: 1).empty?
      @prefs = Preference.create(:fiat_currency => @default_fiat, :time_interval => "1h")
      @prefs.save!
    else
      self.obtainPrefModelFromDB
    end

    if Currency.where(currency_type: 'BTC').empty?
      @currency = Currency.create(:currency_type => 'BTC')
      @currency.save!
    else
      puts 'currency object exists'
      self.obtainCurrencyModelFromDB
    end

    # save prices into the model
    self.updateBtcPrices
  end

  def processCryptoPriceObject(crypto_price_object, currency_object)
    # only save if response is HTTP OK (200)
    if crypto_price_object['Response'] == "Success"
      crypto_price_object['Data'].each do | price |
        # only take the closing price for each time interval, for now
        price_value = price['close']

        # time is a Unix timestamp
        price_time = price['time']
        @currency.prices.create(:price => price_value, :time => price_time)
        puts 'attempted to create price'
        puts @currency.prices.first
      end
      @currency.save
    end
  end


  def updateBtcPrices
    # Obtain the time interval from Preference
    @crypto_prices = nil
    puts 'updating prices now'
    unless @prefs.nil?
      tinterval = @prefs.time_interval
      if tinterval == "1m"
        @crypto_prices = Cryptocompare::HistoMinute.find(@currency.currency_type, @default_fiat)
        self.processCryptoPriceObject(@crypto_prices, @currency)
      elsif tinterval == "1h"
        @crypto_prices = Cryptocompare::HistoHour.find(@currency.currency_type, @default_fiat)
        puts 'calling pcpo'
        self.processCryptoPriceObject(@crypto_prices, @currency)
      elsif tinterval == "1d"
        @crypto_prices = Cryptocompare::HistoDay.find(@currency.currency_type, @default_fiat)
        self.processCryptoPriceObject(@crypto_prices, @currency)
      end
    end
  end

  def obtainPrefModelFromDB
    @prefs = Preference.first
  end

  def obtainCurrencyModelFromDB
    @currency = Currency.where(currency_type: 'BTC').first
  end

  def index
    # update prices from cryptocompare, store in model
  end

end
