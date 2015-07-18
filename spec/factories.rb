# EXAMPLE FACTORIES

FactoryGirl.define do
  factory :user do
    github_user_id 1
  end

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
    contributors_count 3
    pull_request_count 15
  end

  factory :user_repo_action do
    association :user, factory: :user
    association :repo, factory: :repo

    factory :user_repo_like, class: UserRepoAction do
      status 1
    end

    factory :user_repo_hide, class: UserRepoAction do
      status 0
    end
  end
end
