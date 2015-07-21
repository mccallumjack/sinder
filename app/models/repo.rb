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
  		if repo.language == language
  			language_repo_array << repo
  		end
  	end
  	return language_repo_array
  end

  def get_contributor_count
    doc = Nokogiri::HTML(open(html_url))
    contributors_count = doc.css('a:contains("contributors") span.num').text.strip.to_i
  end

  def contributing_file?
    doc = Nokogiri::HTML(open(html_url))
    doc.css('a:contains("CONTRIBUTING")').length != 0 ? true : false
  end

  def open_pull_requests
    doc = Nokogiri::HTML(open(html_url+'/pulls'))
    pull_requests = doc.css('div.left a.selected').text.gsub(/[^\d]/,'').to_i
  end

  def self.update_all
    client = Octokit::Client.new(:client_id => ENV['GITHUB_KEY'], :client_secret => ENV['GITHUB_SECRET'])
    Repo.all.each do |database_repo|
      github_repo = client.repo(database_repo.full_name)
      contributors_count = database_repo.get_contributor_count
      contrib_file = database_repo.contributing_file?
      pull_request_count = database_repo.open_pull_requests
      database_repo.update(
        github_repo_id: github_repo.id,
        url: github_repo.url,
        name: github_repo.name,
        full_name: github_repo.full_name,
        html_url: github_repo.html_url,
        description: github_repo.description,
        pushed_at: github_repo.pushed_at,
        stargazers_count: github_repo.stargazers_count,
        forks_count: github_repo.forks_count,
        open_issues_count: github_repo.open_issues_count,
        language: github_repo.language,
        contributors_count: contributors_count,
        contributors_file: contrib_file,
        pull_request_count: pull_request_count
      )
    end
  end
end
