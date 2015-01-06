class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.string   :name
      t.text     :description
      t.string   :website
      t.string   :pricerange
      t.string   :rating
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :services do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :providers
    drop_table :services
  end
end
