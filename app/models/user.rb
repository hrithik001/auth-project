class User < ApplicationRecord
    has_many :friends, dependent: :destroy
    has_secure_password
    validates :email, presence: true,uniqueness: true;
    validate :email_format

    private

    def email_format
        unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        errors.add(:email, "is not a valid email address")
        end
    end
end
