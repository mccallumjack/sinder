require 'rails_helper'

describe UserRepoAction do
  it "should have a user" do
    action = build(:user_repo_action)
    expect(action.user.class).to eq(User)
  end

  it "should have a repo" do
    action = build(:user_repo_action)
    expect(action.repo.class).to eq(Repo)
  end

  it "should have the correct like status" do
    like = build(:user_repo_like)
    expect(like.status).to eq(1)
  end

  it "should have the correct hide status" do
    hide = build(:user_repo_hide)
    expect(hide.status).to eq(0)
  end
end
