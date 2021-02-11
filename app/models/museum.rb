class Museum < ApplicationRecord
  has_many :works, dependent: :destroy

  def total_works
    works.count
  end
end
