class RenameBitcoinPriceToPrice < ActiveRecord::Migration[5.1]
  def change
    rename_table :bitcoin_prices, :price
  end
end
