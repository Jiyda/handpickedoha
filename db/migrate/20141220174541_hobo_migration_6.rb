class HoboMigration6 < ActiveRecord::Migration
  def self.up
    drop_table :images

    remove_column :services, :image_file_name
    remove_column :services, :image_content_type
    remove_column :services, :image_file_size
    remove_column :services, :image_updated_at
  end

  def self.down
    add_column :services, :image_file_name, :string
    add_column :services, :image_content_type, :string
    add_column :services, :image_file_size, :integer
    add_column :services, :image_updated_at, :datetime

    create_table "images", force: true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "service_id"
    end

    add_index "images", ["service_id"], name: "index_images_on_service_id"
  end
end
