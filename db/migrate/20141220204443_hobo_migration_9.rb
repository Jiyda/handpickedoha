class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :services, :imageurl, :string
  end

  def self.down
    remove_column :services, :imageurl
  end
end
