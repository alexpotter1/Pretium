class RenameBitcoinToCurrency < ActiveRecord::Migration[5.1]
  def change
    rename_table :bitcoins, :currencies
  end
end
