require 'rails_helper'

describe User do
  let!(:user) { build(:user) }

  it "should have a github_access_token" do
    expect(user.github_access_token).not_to be(nil)
  end

  # it "previous starred repos should create records" do
  #   # Stubbing breaks if you try to give put an array with the factorygirl or
  #   # if you don't put faker in a block, validation for github_repo_id will fail
  #   # and you can't do multiple factorygirl calls in the stub
  #   Octokit::Client.any_instance.stub(:starred).and_return( FactoryGirl.create_list(:repo_for_array, 2) )
  #   expect{user.check_interactions}.to change{UserRepoAction.all.length}.by(1)
  # end
end
