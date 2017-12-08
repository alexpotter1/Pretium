class CreateBitcoinPreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :bitcoin_preferences do |t|

      t.timestamps
    end
  end
end
