class Item < ApplicationRecord
  belongs_to :user

  validates :item_type, presence: true
  validates :item_scene, presence: true
  validates :size, presence: true
  validates :status, presence: true
  validates :delivery, presence: true
end
