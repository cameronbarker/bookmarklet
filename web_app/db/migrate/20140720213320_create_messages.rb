class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.boolean :opened
      t.datetime :opened_at
      t.boolean :clicked
      t.datetime :clicked_at
      t.belongs_to :bookmark, index: true
      t.integer :send_from, index: true
      t.integer :send_to, index: true

      t.timestamps
    end
  end
end
