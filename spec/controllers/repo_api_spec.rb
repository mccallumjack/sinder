require 'rails_helper'

RSpec.describe ReposController, type: :controller do

  describe 'GET#index' do

    it 'sends a list of repos' do
      FactoryGirl.create_list(:repo,10)

      get '/api/repos'

      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(10)

    end

  end


end
