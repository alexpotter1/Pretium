require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  def setup
    @ctype = 'BTC'
    @currency = Currency.create(:currency_type => @ctype)
  end

  test 'test accessor currency type successful' do
    assert_equal @currency.currency_type, @ctype
  end
end
