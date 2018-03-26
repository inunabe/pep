class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, uniqueness: true, presence: true
  validates :superior_id, numericality: true, allow_blank: true
  enum role: {
    normal: 0,  #係長まで
    manager: 1,  #課長・次長
    executive: 2,  #部長・支店長・工場長
    admin: 3  #管理者
  }

# アソシエーション（自己結合関連付け）
  has_many :subordinate_users, class_name: 'User', foreign_key: :superior_id
  belongs_to :superior_user, class_name: 'User', foreign_key: :superior_id

  has_many :answering_answers, class_name: 'Answer', foreign_key: :answering_user_id
  has_many :answered_answer, class_name: 'Answer', foreign_key: :answered_user_id

  belongs_to :grade
end
