class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :cover

  validates :title, presence: true
  validates :publishing_house, presence: true
  validates :author_id, presence: true
  validates :cover, content_type: ["image/png", "image/jpeg"], presence: true
end
