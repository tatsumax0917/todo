class ChangeColumnDefaultToTasks < ActiveRecord::Migration[7.1]
  def change
      change_column :tasks, :done, :integer, default: 0

  end
end
