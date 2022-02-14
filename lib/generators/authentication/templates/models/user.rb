class User < ApplicationRecord
  has_secure_password :password
  has_secure_token :session_token

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, length: 8..70, allow_blank: true

  before_validation { self.email = email.downcase.strip }
end
