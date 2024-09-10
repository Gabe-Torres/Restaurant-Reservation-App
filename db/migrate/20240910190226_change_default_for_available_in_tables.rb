class ChangeDefaultForAvailableInTables < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tables, :available, true
  end
end
