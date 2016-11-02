class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :task
      t.boolean :done, default: false
      t.integer :progress, default: 0

      t.timestamps null: false
    end
  end
end
