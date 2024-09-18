class Like < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  validates_uniqueness_of :chat_id, scope: :user_id
end
