class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :line_code1
      t.string :destination
      t.string :minutes
      t.float :lat
      t.float :long
      t.float :distance
      t.string :line_code2
      t.string :line_code3
      t.string :other_platform
      t.string :station_code

      t.timestamps null: false
    end
  end
end
