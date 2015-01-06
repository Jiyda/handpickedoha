class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :services, :category_id, :integer

    add_index :services, [:category_id]
  end

  def self.down
    remove_column :services, :category_id

    remove_index :services, :name => :index_services_on_category_id rescue ActiveRecord::StatementInvalid
  end
end
