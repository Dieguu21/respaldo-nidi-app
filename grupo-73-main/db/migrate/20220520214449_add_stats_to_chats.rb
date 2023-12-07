class AddStatsToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :mensajes, :text
  end
end
