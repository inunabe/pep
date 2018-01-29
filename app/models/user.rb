class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  enum role: {
    nomal: 0,
    manager: 1,
    executive: 2,
    admin: 3
    # managerとexecutiveが管理職
  }

# アソシエーション（自己結合関連付け）

  has_many :subordinate_users, class_name: 'User', foreign_key: :superior_id
  belongs_to :superior_user, class_name: 'User', foreign_key: :superior_id

end
