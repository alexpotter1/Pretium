class RenamePriceToPrices < ActiveRecord::Migration[5.1]
  def change
    rename_table :price, :prices
  end
end
