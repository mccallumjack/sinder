require 'rails_helper'

describe Repo do
  let!(:repo) { create(:repo) }
  let!(:user) { create(:user) }

  it "should have correct attributes as strings" do
    expect(repo.url).to be_kind_of(String)
    expect(repo.name).to be_kind_of(String)
    expect(repo.full_name).to be_kind_of(String)
    expect(repo.html_url).to be_kind_of(String)
    expect(repo.description).to be_kind_of(String)
    expect(repo.language).to be_kind_of(String)
  end

  it "should have correct attributes as integers" do
    expect(repo.github_repo_id).to be_kind_of(Integer)
    expect(repo.stargazers_count).to be_kind_of(Integer)
    expect(repo.forks_count).to be_kind_of(Integer)
    expect(repo.open_issues_count).to be_kind_of(Integer)
    expect(repo.contributors_count).to be_kind_of(Integer)
    expect(repo.pull_request_count).to be_kind_of(Integer)
  end

  it "should return repos in the correct language" do
    expect(Repo.language_repos(user, 'Ruby').length).to eq(1)
  end

  it "should not return repos in the wrong language" do
    expect(Repo.language_repos(user, 'Javascript').length).to eq(0)
  end
end
