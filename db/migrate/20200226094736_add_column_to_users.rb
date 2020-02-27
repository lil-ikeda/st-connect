class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :image, :text
    add_column :users, :profile, :text, null: false
    add_column :users, :url, :string
  end
end
