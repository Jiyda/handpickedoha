class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :providers, :service_id, :integer

    add_index :providers, [:service_id]
  end

  def self.down
    remove_column :providers, :service_id

    remove_index :providers, :name => :index_providers_on_service_id rescue ActiveRecord::StatementInvalid
  end
end
