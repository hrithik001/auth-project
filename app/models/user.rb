class User < ApplicationRecord
    has_secure_password

    has_many :friends, dependent: :destroy

    before_create :create_session_token
    validates :session_token, uniqueness: true, allow_nil: true

    validates :email, presence: true,uniqueness: true;
    validate :email_format
    
    def create_session_token
        self.session_token = SecureRandom.hex(10) 
    end

    private

    def email_format
        unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        errors.add(:email, "is not a valid email address")
        end
    end
   

end
