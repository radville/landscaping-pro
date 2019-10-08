class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :landscaper_id
      t.string :description
      
      t.timestamps
    end
  end
end
