class CreateLandscaperServices < ActiveRecord::Migration[6.0]
  def change
    create_table :landscaper_services do |t|
      t.integer :service_id
      t.integer :landscaper_id
    end
  end
end
