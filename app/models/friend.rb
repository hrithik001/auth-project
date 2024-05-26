class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name,  presence: true
  validates :email, :contact_number, presence: true , uniqueness: true
  
end
