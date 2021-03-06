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

  # No template is rendered by this action.
  def update
    @prefs.update(prefs_params)
    ActiveRecord::Base.connection.execute("DELETE FROM currencies WHERE 1")
    ActiveRecord::Base.connection.execute("DELETE FROM prices WHERE 1")
    if @prefs.save!
      redirect_to bitcoin_index_path, notice: 'Preferences successfully saved'
    else
      redirect_to bitcoin_index_path, notice: 'Preferences not saved'
    end
  end

  def obtainPrefModelFromDB
    @prefs = Preference.first
  end

  # Preference model object needs to be accessible to the btc/eth view so it can get settings
  attr_reader :prefs, :default_fiat

  # Strong parameters, used for update
  private
  def prefs_params
    params.require(:prefs).permit(:time_interval, :fiat_currency)
  end

end
