class Program < ApplicationRecord
  belongs_to :gallery

  def self.select_programs(params_id, params_participants, params_sort)
    if params_id
      where(gallery_id: params_id)
      .where('number_of_participants > ?', params_participants.to_i)
      .order(params_sort, created_at: :desc)
    else
      where('number_of_participants > ?', params_participants.to_i)
      .order(params_sort, created_at: :desc)
    end
  end
end
