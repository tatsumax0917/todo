class RemoveUsersTaskIdColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :task_id
  end
end
