class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :owner_id, index: true
      t.string :encounter_point
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
