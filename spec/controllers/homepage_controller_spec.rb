require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns github secret key to @client_id" do
      get :index
      expect(assigns(:client_id)).to eq(ENV["GITHUB_KEY"]w)
    end
  end
end
