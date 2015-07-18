require 'rails_helper'

describe User do
  let!(:user) { build(:user) }

  it "User should have a github_user_id" do
    expect(user.github_user_id).not_to be(nil)
  end
end
