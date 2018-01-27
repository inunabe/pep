class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  enum role: {
    nomal: 0
    manager: 1
    admin: 2
  }

end
