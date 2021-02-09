class CreateWork < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :name
      t.string :artist
      t.integer :year
      t.string :on_display
      t.string :medium
      t.timestamps
    end
  end
end
