class Author < ApplicationRecord
  has_many :books

  with_options presence:true do
    validates :first_name, :last_name, :email, :phone_number
  end

  def full_name
    first_name + " " + last_name
  end


end
