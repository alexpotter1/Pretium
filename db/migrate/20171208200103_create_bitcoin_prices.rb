class CreateBitcoinPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :bitcoin_prices do |t|

      t.timestamps
    end
  end
end
