class CreateLandscaperTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :landscaper_tasks do |t|
      t.integer :task_id, null: false
      t.integer :landscaper_id, null: false
    end
  end
end
