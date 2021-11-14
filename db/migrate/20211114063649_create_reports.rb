class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.text :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reports,[:user_id, :created_at]
  end
end
