class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.text :image
      t.string :place, null: false
      t.time :open_time, null: false
      t.time :end_time
      t.integer :owner, null: false
      t.timestamps
    end
  end
end
