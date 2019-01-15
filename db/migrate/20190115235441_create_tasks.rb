class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date_time :deadline
      t.boolean :done

      t.timestamps
    end
  end
end
