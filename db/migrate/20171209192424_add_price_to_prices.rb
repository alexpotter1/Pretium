class AddPriceToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :price, :string
  end
end
