class AddAvailableToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :tables, :available, :boolean
  end
end
