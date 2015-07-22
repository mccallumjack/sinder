FactoryGirl.define do
  factory :repo do
    github_repo_id 1296269
    url "https://api.github.com/repos/octocat/Hello-World"
    name "Hello-World"
    full_name "octocat/Hello-World"
    html_url "https://github.com/octocat/Hello-World"
    description "This is your first repo!"
    pushed_at "2011-01-26T19:06:43Z"
    stargazers_count 80
    forks_count 9
    language "Ruby"
    open_issues_count 0
    contributors_count 2
    contributors_file true
    pull_request_count 15
    factory :updated do
      language "Python"
    end
    factory :repo_for_array do
      github_repo_id {Faker::Number.number(7)}
    end
  end
end
