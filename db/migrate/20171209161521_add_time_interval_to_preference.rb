class AddTimeIntervalToPreference < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :time_interval, :string
  end
end
