class HoboMigration8 < ActiveRecord::Migration
  def self.up
    remove_column :services, :photo_file_name
    remove_column :services, :photo_content_type
    remove_column :services, :photo_file_size
    remove_column :services, :photo_updated_at
  end

  def self.down
    add_column :services, :photo_file_name, :string
    add_column :services, :photo_content_type, :string
    add_column :services, :photo_file_size, :integer
    add_column :services, :photo_updated_at, :datetime
  end
end
