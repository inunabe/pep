class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answering_user, class_name: 'User', foreign_key: :answering_user_id
  belongs_to :answered_user, class_name: 'User', foreign_key: :answered_user_id
  belongs_to :period
end
