require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  def setup
    @preference_model_object = Preference.new(:fiat_currency => 'EUR', :time_interval => '1d')
  end

  test 'test accessor fiat currency type successful' do
    assert_equal @preference_model_object.fiat_currency, 'EUR'
  end

  test 'test accessor time interval successful' do
    assert_equal @preference_model_object.time_interval, '1d'
  end
end
