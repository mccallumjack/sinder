class CreateRepo < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :github_repo_id
      t.string :url
      t.string :name
      t.string :full_name
      t.string :html_url
      t.text :description
      t.datetime :pushed_at
      t.integer :stargazers_count
      t.integer :forks_count
      t.string :language
      t.integer :open_issues_count
      t.integer :contributors_count
      t.integer :pull_request_count

      t.timestamps
    end
  end
end
