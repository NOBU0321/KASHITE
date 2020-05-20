class Item < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :item_type, presence: true
  validates :item_scene, presence: true
  validates :size, presence: true
  validates :status, presence: true
  validates :delivery, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
end
