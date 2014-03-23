class CreateScoresTable < ActiveRecord::Migration
  def change
    create_join_table :packages, :places, table_name: :scores do |t|
      t.integer :package_id
      t.integer :place_id
      t.float :value
    end
  end
end
