class Repo < ActiveRecord::Base
  has_many :actions, class_name: "UserRepoAction"
  has_many :users, through: :actions

  validates :github_repo_id, uniqueness: true, presence: true
end
