class Gallery < ApplicationRecord
  has_many :programs, dependent: :destroy
end
