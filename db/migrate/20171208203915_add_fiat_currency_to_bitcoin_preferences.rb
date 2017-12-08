class AddFiatCurrencyToBitcoinPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :bitcoin_preferences, :fiat_currency, :string
  end
end
