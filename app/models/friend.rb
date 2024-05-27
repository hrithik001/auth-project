class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name,  presence: true
  validates :email, :contact_number, presence: true , uniqueness: true
  validate :email_format

  private
  def email_format
    unless email =~ /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/
      errors.add(:email, 'is not in the correct format')
    end
  end
  
  
end
