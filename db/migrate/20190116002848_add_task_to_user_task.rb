class AddTaskToUserTask < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_tasks, :task, foreign_key: true
  end
end
