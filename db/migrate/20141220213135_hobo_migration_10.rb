class HoboMigration10 < ActiveRecord::Migration
  def self.up
    add_column :providers, :imageurl, :string
  end

  def self.down
    remove_column :providers, :imageurl
  end
end
