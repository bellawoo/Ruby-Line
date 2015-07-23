class AddDistanceToMetroStations < ActiveRecord::Migration
  def change
    add_column :train_stations, :distance, :float
  end
end
