class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :chats, dependent: :destroy
 has_many :likes, dependent: :destroy
 has_many :liked_chats, through: :likes, source: :chat
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

 def already_liked?(chat)
  self.likes.exists?(chat_id: chat.id)
 end
end
