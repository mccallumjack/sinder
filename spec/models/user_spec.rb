require 'rails_helper'

describe User do
  let!(:user) { build(:user) }

  it "User should have a github_access_token" do
    expect(user.github_access_token).not_to be(nil)
  end
end
