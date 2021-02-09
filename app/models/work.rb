class Work < ApplicationRecord
  belongs_to :museum

  def self.display_true
    where(on_display: "true")
  end
end
