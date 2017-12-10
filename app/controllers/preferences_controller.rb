class PreferencesController < ApplicationController

  def initialize
    # Make sure to initialise the ApplicationController if it is not already initialised
    super

    # Made in England, so default to Pound Sterling currency type
    @default_fiat = 'GBP'

    # Auto-create a preference model if it doesn't exist
    # Note: This is done here, because only one preference object is ever intended to exist.
    @prefs = nil
    if Preference.where(id: 1).empty?
      @prefs = Preference.create(:fiat_currency => @default_fiat, :time_interval => "1h")
      @prefs.save!
    else
      self.obtainPrefModelFromDB
    end
  end

  def update

  end

  def obtainPrefModelFromDB
    @prefs = Preference.first
  end

  # Preference model object needs to be accessible to the btc/eth view so it can get settings
  attr_reader :prefs, :default_fiat

end
