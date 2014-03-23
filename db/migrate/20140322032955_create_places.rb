class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :lat
      t.float :long
      t.string :short_name
      t.string :address
      t.float :package_1
      t.float :package_2
      t.float :package_3
      t.float :package_4

      t.timestamps
    end
  end
end
