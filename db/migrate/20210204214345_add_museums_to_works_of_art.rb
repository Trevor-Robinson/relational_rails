class AddMuseumsToWorksOfArt < ActiveRecord::Migration[5.2]
  def change
    add_reference :works_of_art, :museum, foreign_key: true
  end
end
