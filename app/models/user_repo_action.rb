class UserRepoAction < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  validates :status, presence: true

  def self.star(user_github_access_token, repo_full_name)
    # Need to add auth to client token
    client = Octokit::Client.new(access_token: user_github_access_token)
    client.star(repo_full_name)
    user = User.find_by(github_access_token: user_github_access_token)
    repo = Repo.find_by(full_name: repo_full_name)
    self.create(user: user, repo: repo, status: 1)
  end
end
