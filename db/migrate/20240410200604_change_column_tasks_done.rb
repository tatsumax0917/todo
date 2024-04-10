class ChangeColumnTasksDone < ActiveRecord::Migration[7.1]
  def change
    def up
      change_column_default :tasks, :done, default: false
    end
    def down
      change_column :tasks, :done, default: false
    end
  end
end
