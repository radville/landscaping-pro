class CreateTableLandscapersTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :table_landscapers_tasks do |t|
      t.integer :landscaper_id
      t.integer :task_id

    end
  end
end
