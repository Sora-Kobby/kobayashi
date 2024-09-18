class AddImagesToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :image, :string
  end
end
