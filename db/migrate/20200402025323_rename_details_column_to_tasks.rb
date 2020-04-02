class RenameDetailsColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :details, :detail
  end
end
