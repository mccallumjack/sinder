# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
whitelist = [
  "pydata/pandas",
  "HabitRPG/habitrpg",
  "scikit-learn/scikit-learn",
  "nnnick/Chart.js",
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

client = Octokit::Client.new(:client_id => ENV['GITHUB_KEY'], :client_secret => ENV['GITHUB_SECRET'])

whitelist.each do |address|
  repo = client.repo address
  # contributors_count = client.contributors_stats(address).length
  pull_request_count = client.pull_requests(address).length
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
    # contributors_count: contributors_count,
    pull_request_count: pull_request_count
  )
end
