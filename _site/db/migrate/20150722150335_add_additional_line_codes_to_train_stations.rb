class AddAdditionalLineCodesToTrainStations < ActiveRecord::Migration
  def change
    change_table :train_stations do |t|
      t.string :line_code1
      t.string :line_code2
      t.string :line_code3
      t.string :other_platform
    end
  end
end
