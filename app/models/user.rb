class User < ActiveRecord::Base

  has_many :actions, class_name: "UserRepoAction"
  has_many :repos, through: :actions

  validates :github_access_token, uniqueness: true, presence: true

  def check_interactions
    client = Octokit::Client.new(access_token: github_access_token)
    check_interaction(client.starred)
    check_interaction(client.subscriptions)
  end

  def check_interaction(repo_array)
    repo_array.each do |repo|
      if our_repo = Repo.find_by(github_repo_id: repo.id)
        UserRepoAction.where(user: self, repo: our_repo, status: 1).first_or_create
      end
    end
  end

  def destroy_interactions
    UserRepoAction.where(user: self).destroy_all
  end
end
