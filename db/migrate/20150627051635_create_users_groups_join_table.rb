class CreateUsersGroupsJoinTable < ActiveRecord::Migration
  def change
    create_table :groups_users, id: false do |t|
      t.integer :group_id, index: true
      t.integer :member_id, index: true
    end

    add_index :groups_users, [:group_id, :member_id]
  end
end
