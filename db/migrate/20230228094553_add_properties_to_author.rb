class AddPropertiesToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :email, :string
    add_column :authors, :phone_number, :integer
  end
end
