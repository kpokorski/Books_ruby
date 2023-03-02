class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :tittle, :year, :author_id, :ISBN_number, :publishing_house, :description
end
