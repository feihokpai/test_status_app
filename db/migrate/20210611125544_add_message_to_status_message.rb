class AddMessageToStatusMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :status_messages, :message, :text
  end
end
