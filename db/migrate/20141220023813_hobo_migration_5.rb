class HoboMigration5 < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :service_id
    end
    add_index :images, [:service_id]
  end

  def self.down
    drop_table :images
  end
end
