class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :github_user_id
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :github_login

      t.timestamps
    end

    add_index :users, :email, unique: true

  end
end
