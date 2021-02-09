class AddMuseumsToWorks < ActiveRecord::Migration[5.2]
  def change
    add_reference :works, :museum, foreign_key: true
  end
end
