json.extract! book, :id, :tittle, :year,:ISBN_number,:publishing_house,:author_id,:description,:cover, :created_at, :updated_at
json.url book_url(book, format: :json)
