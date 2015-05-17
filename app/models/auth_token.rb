class AuthToken < ActiveRecord::Base
  has_secure_token :token

  belongs_to :user

  validates :user, presence: true
end
