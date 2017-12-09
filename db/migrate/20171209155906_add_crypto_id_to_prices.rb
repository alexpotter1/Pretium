class AddCryptoIdToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :crypto_id, :integer
    add_index :prices, :crypto_id
  end
end
