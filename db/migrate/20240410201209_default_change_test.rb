class DefaultChangeTest < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :done, from: true, to: false
  end
end
