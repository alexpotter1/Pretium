class AddTimeToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :time, :string
  end
end
