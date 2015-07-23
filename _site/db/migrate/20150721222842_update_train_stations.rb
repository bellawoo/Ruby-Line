class UpdateTrainStations < ActiveRecord::Migration
  def change
    change_table :train_stations do |t|
      t.string :code
      t.string :name
      t.float :lat
      t.float :long
    end

    create_table :trains do |t|
      t.string :line
      t.string :destination
      t.string :minutes
    end
  end
end
