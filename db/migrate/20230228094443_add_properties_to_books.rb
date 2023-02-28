class AddPropertiesToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :ISBN_number, :integer
    add_column :books, :publishing_house, :string
    add_column :books, :description, :text
  end
end
