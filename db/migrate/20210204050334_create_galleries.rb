class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :capacity
      t.boolean :tech_support

       t.timestamps
    end
  end
end
