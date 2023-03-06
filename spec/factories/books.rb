FactoryBot.define do
  factory :book do
    tittle {"Die Hard"}
    year {2000}
    author_id {1}
    association :author
    ISBN_number {5665}
    publishing_house {"Znak"}
    description {"Very interesting book."}
  end
end
