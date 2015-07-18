FactoryGirl.define do
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
