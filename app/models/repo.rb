class Repo < ActiveRecord::Base
  has_many :actions, class_name: "UserRepoAction"
  has_many :users, through: :actions

  validates :github_repo_id, uniqueness: true, presence: true

  def self.all_repos(user)
  	new_repos = []
  	self.all.each do |repo|
  		unless UserRepoAction.find_by(user_id: user.id, repo_id: repo.id)
  			new_repos << repo
  		end
  	end
  	return new_repos
  end

  def self.language_repos(user, language)
  	language_repo_array = []
  	self.all_repos(user).each do |repo|
  		if repo.language.downcase == language.downcase
  			language_repo_array << repo
  		end
  	end
  	return language_repo_array
  end
end
