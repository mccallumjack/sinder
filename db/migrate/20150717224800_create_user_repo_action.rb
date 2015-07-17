class CreateUserRepoAction < ActiveRecord::Migration
  def change
    create_table :user_repo_actions do |t|
      t.references :user
      t.references :repo
      t.integer :status #0 for rejected repo and 1 for already interacted with repo (starred/watched/forked)

      t.timestamps
    end
  end
end
