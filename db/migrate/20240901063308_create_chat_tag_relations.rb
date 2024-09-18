class CreateChatTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_tag_relations do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
