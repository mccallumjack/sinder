class User < ActiveRecord::Base

  has_many :actions, class_name: "UserRepoAction"
  has_many :repos, through: :actions

  validates :github_access_token, uniqueness: true, presence: true

  def check_interactions
    client = Octokit::Client.new(access_token: github_access_token)
    check_starred(client.starred)
  end

  def check_starred(starred_repos)
    starred_repos.each do |repo|
      if our_repo = Repo.find_by(github_repo_id: repo.id)
        UserRepoAction.where(user: self, repo: our_repo, status: 1).first_or_create
      end
    end
  end
end
