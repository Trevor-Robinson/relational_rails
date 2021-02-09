class Museum < ApplicationRecord
  has_many :works

  def self.most_recent_first
    order(created_at: :desc)
  end

  def total_works
    works.count
  end
end
