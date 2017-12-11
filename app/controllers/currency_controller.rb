require 'cryptocompare'
require 'date'

class CurrencyController < ApplicationController

  def initialize(options = {})
    @currency = nil
    @prefs_controller = options[:pref_controller] || PreferencesController.new
    @ctype = options[:currency_type] || 'BTC'


    if Currency.where(currency_type: @ctype).empty?
      puts 'new currency object'
      @currency = Currency.create(:currency_type => @ctype)
      @currency.save!
    else
      puts 'currency object exists'
      self.obtainCurrencyModelFromDB
    end

    # Put latest price data from Cryptocompare into the currency model
    self.updatePrices

  end

  def processCryptoPriceObject(crypto_price_object, currency_object)
    # only save if response is HTTP OK (200)
    puts crypto_price_object

    # Only get first 3h of minute-by-minute values to improve loading performance
    if @prefs_controller.prefs.time_interval == "1m"
      restricted = 1
    end

    if crypto_price_object['Response'] == "Success"
      counter = 0
      crypto_price_object['Data'].each do | price |

        # stop after certain time if restricted = True
        if restricted == 1 && counter == 180
          break
        end

        # only take the closing price for each time interval, for now
        price_value = price['close']

        # time is a Unix timestamp, so convert
        price_time = Time.at(price['time']).to_datetime
        @currency.prices.create(:price => price_value, :time => price_time)
        puts 'attempted to create price'

        counter += 1
      end
      @currency.save
    else
      puts 'error retrieving data from cryptocompare'
    end
  end




  def updatePrices
    # Obtain the time interval from Preference
    @crypto_prices = nil
    puts 'updating prices now'
    unless @prefs_controller.prefs.nil?
      tinterval = @prefs_controller.prefs.time_interval
      if tinterval == "1m"
        @crypto_prices = Cryptocompare::HistoMinute.find(@currency.currency_type, @prefs_controller.prefs.fiat_currency)
        self.processCryptoPriceObject(@crypto_prices, @currency)
      elsif tinterval == "1h"
        @crypto_prices = Cryptocompare::HistoHour.find(@currency.currency_type, @prefs_controller.prefs.fiat_currency)
        puts 'calling pcpo'
        self.processCryptoPriceObject(@crypto_prices, @currency)
      elsif tinterval == "1d"
        @crypto_prices = Cryptocompare::HistoDay.find(@currency.currency_type, @prefs_controller.prefs.fiat_currency)
        self.processCryptoPriceObject(@crypto_prices, @currency)
      end
    end
  end

  def obtainCurrencyModelFromDB
    @currency = Currency.where(currency_type: @ctype).first
  end

  # Allow currency object to be obtained by other views and controllers
  attr_reader :currency

end
