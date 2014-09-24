class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :username,           null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :access_token,       null: false, default: ""
      t.string :uuid,               null: false, default: ""
      t.integer :pin


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :access_token,         unique: true
    add_index :users, :uuid,                 unique: true
    add_index :users, :username,             unique: true
  end
end
