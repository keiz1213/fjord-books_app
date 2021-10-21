class RenameAddlessColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :addless, :address
  end
end
