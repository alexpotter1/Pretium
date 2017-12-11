require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  def setup
    @prefs_controller = PreferencesController.new
    @currency_controller = CurrencyController.new(currency_type: 'ETH', pref_controller: @prefs_controller)

    # Drop prices table from db, because we don't want to use the (changing) cryptocompare values
    ActiveRecord::Base.connection.execute("DELETE FROM prices WHERE 1")

    # Create dummy price data and test if saves properly
    @t_price = '322.91'
    @t_time = '2017-12-04T13:00:00+00:00'

    @currency_controller.currency.prices.create(:price => @t_price, :time => @t_time)
  end

  test 'test set price successful' do
    assert_equal @currency_controller.currency.prices.first.price, @t_price
  end

  test 'test set time successful' do
    assert_equal @currency_controller.currency.prices.first.time, @t_time
  end
end
