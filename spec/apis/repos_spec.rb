require 'rails_helper'



describe Api::ReposController, type: :controller do

  describe 'GET#index' do

    it 'responds with a 200' do
      get :index, format: :json
      expect(response).to be_success
    end

    it 'responds with a 200 when a language is specified' do
      get :index,  {language: "ruby"}, format: :json
      expect(response).to be_success
    end


  end


  describe 'GET#issues' do

    it 'responds with a 200 when a repo is passed' do
      create(:repo)
      id = Repo.first.id
      get :issues, {id: id}
      expect(response).to be_success
    end

  end


end
