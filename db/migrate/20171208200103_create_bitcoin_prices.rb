class CreateBitcoinPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :bitcoin_prices do |t|
      t.belongs_to :currency
      t.timestamps
    end
  end
end
