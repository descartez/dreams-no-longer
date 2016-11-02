class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :task
      t.boolean :done
      t.integer :progress

      t.timestamps null: false
    end
  end
end
