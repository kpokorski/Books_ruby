class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :cover

  validates :tittle, presence: true
  validates :publishing_house, presence: true
  validates :author_id, presence: true

end
