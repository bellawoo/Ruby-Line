class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :name
      t.integer :bikes_avail
      t.integer :docks_avail
      t.float :lat
      t.float :long
      t.float :distance

      t.timestamps null: false
    end
  end
end
