class ChatTagRelation < ApplicationRecord
  belongs_to :chat
  belongs_to :tag
end
