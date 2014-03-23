class AddCategoriesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :categories, :text
  end
end
