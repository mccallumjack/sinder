class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_access_token

      t.timestamps
    end
  end
end
