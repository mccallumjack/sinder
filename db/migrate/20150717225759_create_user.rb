class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :github_user_id

      t.timestamps
    end
  end
end
