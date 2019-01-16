class AddTaskToAttachments < ActiveRecord::Migration[5.1]
  def change
    add_reference :attachments, :task, foreign_key: true
  end
end
