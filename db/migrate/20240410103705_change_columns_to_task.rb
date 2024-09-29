class ChangeColumnsToTask < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :content, false
    change_column_null :tasks, :done, false
  end
end
