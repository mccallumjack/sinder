class AddCodeOfConductToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :code_of_conduct, :boolean
  end
end
