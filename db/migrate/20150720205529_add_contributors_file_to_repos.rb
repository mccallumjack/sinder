class AddContributorsFileToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :contributors_file, :boolean
  end
end
