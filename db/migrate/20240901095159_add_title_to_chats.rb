class AddTitleToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :title, :string
  end
end
