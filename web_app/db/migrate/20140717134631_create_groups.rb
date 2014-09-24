class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.boolean :locked

      t.timestamps
    end
  end
end
