require 'cryptocompare'

class BitcoinController < ApplicationController

  def index
    cryptoPriceObject = Cryptocompare::Price.find('BTC', 'GBP')
    @price = cryptoPriceObject['BTC']['GBP']

  end

end
