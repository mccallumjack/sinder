class UserRepoAction < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  validates :status, presence: true

  def this.star(user_github_access_token, repo_full_name)
    client = Octokit::Client.new(access_token: user_github_access_token)
    client.star(repo_full_name)
    user = User.find_by(github_access_token: user_github_access_token)
    repo = Repo.find_by(full_name: repo_full_name)
    this.create(user: user, repo: repo, status: 1)
  end
end
