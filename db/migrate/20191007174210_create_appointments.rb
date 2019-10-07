class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :landscaper_id
      t.integer :user_id
      t.datetime :datetime
      t.string :frequency
      t.boolean :recurring, default: false
      t.integer :price
      
      t.timestamps
    end
  end
end
