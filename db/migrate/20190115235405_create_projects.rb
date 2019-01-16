class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :start_date

      t.timestamps
    end
    add_index :projects, :name, unique: true
  end
end
