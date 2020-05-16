class Land < ApplicationRecord
  belongs_to :user
  validates :land_type, presence: true
  validates :purpose, presence: true
  validates :size, presence: true
  validates :is_tap, presence: true
  validates :is_electronic, presence: true
  validates :is_gas, presence: true
end
