class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.belongs_to :url, index: true
      t.string :note
      t.string :title
      t.string :send_to
      t.string :image_url

      t.timestamps
    end
  end
end
