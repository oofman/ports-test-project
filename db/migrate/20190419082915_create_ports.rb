class CreatePorts < ActiveRecord::Migration[5.0]
  def up
    create_table :ports do |t|
      t.string :code, null: false, index: {unique: true}
      t.string :name, null: false
      t.string :city
      t.float :latitude, :limit => 30
      t.float :longitude, :limit => 30
      t.string :big_schedules
      t.string :port_type, null: false
      t.boolean :hub_port, default: false
      t.string :oi_code
      t.string :oi, null: true

      t.timestamps
    end

  end

  def down
    drop_table :ports
  end
end
