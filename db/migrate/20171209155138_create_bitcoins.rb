class CreateBitcoins < ActiveRecord::Migration[5.1]
  def change
    create_table :bitcoins do |t|

      t.timestamps
    end
  end
end
