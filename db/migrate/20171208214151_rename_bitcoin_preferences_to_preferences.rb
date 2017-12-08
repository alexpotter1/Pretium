class RenameBitcoinPreferencesToPreferences < ActiveRecord::Migration[5.1]
  def change
    rename_table :bitcoin_preferences, :preferences
  end
end
