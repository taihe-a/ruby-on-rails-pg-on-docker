class AddPriorityToTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :priority, :integer
  end

  def down
    remove_column :tasks, :priority
  end
end
