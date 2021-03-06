class CreateMuseum < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name
      t.string :city
      t.integer :admission_cost
      t.string :old_masters
      t.string :architect
      t.timestamps
    end
  end
end
