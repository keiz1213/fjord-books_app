# frozen_string_literal: true

class RenameAddlessColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :addless, :address
  end
end
