class Chat < ApplicationRecord
    belongs_to :user

    has_many :likes, dependent: :destroy    
    has_many :liked_users, through: :likes, source: :user

    has_many :chat_tag_relations, dependent: :destroy
    has_many :tags, through: :chat_tag_relations, dependent: :destroy

    

    mount_uploader :image, ImageUploader

    validates :drink, :snack, presence: true
end
