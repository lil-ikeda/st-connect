class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :date, null: false
      t.text :image
      t.string :place, null: false
      t.string :time, null: false
      t.integer :owner, null: false
      t.timestamps
    end
  end
end
