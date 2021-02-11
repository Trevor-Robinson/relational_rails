class Gallery < ApplicationRecord
  has_many :programs, dependent: :destroy

  def self.select_rooms(params_capacity, params_sort)
    if params_sort
      select("galleries.*, COUNT(*) AS count")
      .left_outer_joins(:programs)
      .group(:id)
      .where('capacity > ?', params_capacity)
      .order(count: :desc, tech_support: :desc, created_at: :desc)
    else
      where('capacity > ?', params_capacity)
      .order(tech_support: :desc, created_at: :desc)
    end
  end
end
