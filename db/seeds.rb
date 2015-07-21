require 'nokogiri'
require 'open-uri'


whitelist = [
  "pydata/pandas",
  "HabitRPG/habitrpg",
  "scikit-learn/scikit-learn",
  "ruby/ruby",
  "golang/go",
  "debops/debops",
  "neovim/neovim",
  "cockroachdb/cockroach",
  "googlecloudplatform/kubernetes",
  "OpenBazaar/OpenBazaar",
  "ipfs/go-ipfs",
  "spree/spree",
  "rails/rails",
  "mbostock/d3",
  "jekyll/jekyll",
  "ipython/ipython",
  "mattbaker/ruby-heap-viz",
  "chef/chef",
  "mperham/sidekiq",
  "thoughtbot/factory_girl",
  "gollum/gollum",
  "django/django",
  "jkbrzt/httpie",
  "ansible/ansible",
  "scrapy/scrapy",
  "jquery/jquery",
  "Esri/quickstart-map-js",
  "Esri/map-tour-storytelling-template-js",
  "researchkit/researchkit",
  "jonobr1/two.js",
  "tessalt/echo-chamber-js",
  "google/material-design-lite",
  "FreeCodeCamp/freecodecamp",
  "plataformatec/devise",
  "caskroom/homebrew-cask",
  "arunagw/omniauth-twitter",
  "vinta/awesome-python",
  "donnemartin/data-science-ipython-notebooks"
]

 # Nokogiri methods
def get_contributor_count(repo)
  doc = Nokogiri::HTML(open(repo.html_url))
  contributors_count = doc.css('a:contains("contributors") span.num').text.strip.to_i
end

def contributing_file?(repo)
  doc = Nokogiri::HTML(open(repo.html_url))
  doc.css('a:contains("CONTRIBUTING")').length != 0 ? true : false
end

def open_pull_requests(repo)
  doc = Nokogiri::HTML(open(repo.html_url+'/pulls'))
  pull_requests = doc.css('div.left a.selected').text.gsub(/[^\d]/,'').to_i
end


client = Octokit::Client.new(:client_id => ENV['GITHUB_KEY'], :client_secret => ENV['GITHUB_SECRET'])

whitelist.each do |address|
  repo = client.repo(address)
  contributors_count = get_contributor_count(repo)
  contrib_file = contributing_file?(repo)
  pull_request_count = open_pull_requests(repo)
  Repo.create!(
    github_repo_id: repo.id,
    url: repo.url,
    name: repo.name,
    full_name: repo.full_name,
    html_url: repo.html_url,
    description: repo.description,
    pushed_at: repo.pushed_at,
    stargazers_count: repo.stargazers_count,
    forks_count: repo.forks_count,
    open_issues_count: repo.open_issues_count,
    language: repo.language,
    contributors_count: contributors_count,
    contributors_file: contrib_file,
    pull_request_count: pull_request_count
  )
end
