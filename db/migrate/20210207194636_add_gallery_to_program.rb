class AddGalleryToProgram < ActiveRecord::Migration[5.2]
  def change
  add_reference :programs, :gallery, foreign_key: true  end
  end
