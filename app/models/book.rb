class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :cover

  with_options presence:true do
    validates :tittle, :publishing_house, :author_id
  end

end
