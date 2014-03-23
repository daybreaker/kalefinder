class RemovePackageColumnsFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :package_1, :float
    remove_column :places, :package_2, :float
    remove_column :places, :package_3, :float
    remove_column :places, :package_4, :float
  end
end
