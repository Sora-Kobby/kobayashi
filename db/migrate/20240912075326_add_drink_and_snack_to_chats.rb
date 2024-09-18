class AddDrinkAndSnackToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :drink, :string
    add_column :chats, :snack, :string
  end
end
