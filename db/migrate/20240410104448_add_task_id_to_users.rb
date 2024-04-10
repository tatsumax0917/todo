class AddTaskIdToUsers < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :task_id, :integer, null: false
  end

  def down
    change_column :users, :task_id, :integer, null: true
  end
end
