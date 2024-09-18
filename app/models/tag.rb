class Tag < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :chat_tag_relations, dependent: :destroy
    has_many :chats, through: :chat_tag_relations, dependent: :destroy
end

