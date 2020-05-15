class Land < ApplicationRecord
  belongs_to :user
  
  validates :land_type, presence: true
end
