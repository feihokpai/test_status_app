class CreateStatusMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :status_messages do |t|
      t.references :application, null: false, foreign_key: true
      t.references :status_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
