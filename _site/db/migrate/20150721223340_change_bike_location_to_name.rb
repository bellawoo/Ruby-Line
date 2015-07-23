class ChangeBikeLocationToName < ActiveRecord::Migration
  def change
    rename_column :bikes, :location, :name
  end
end
