require 'rails_helper'



describe Api::ReposController, type: :controller do

  describe 'GET#index' do

    let!(:user) {create(:user)}
    let!(:repo) {create(:repo)}

    it 'responds with a 200' do
      get :index,{},{:access_token => user.github_access_token}, format: :json
      expect(response).to be_success
    end

    it 'responds with a 200 when a language is specified' do
      get :index,  {language: "Ruby"}, {:access_token => user.github_access_token}, format: :json
      expect(response).to be_success
    end

    it 'has something in the body' do
      get :index,{},{:access_token => user.github_access_token}, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    it 'has something in the body if the language is correct' do
      get :index, { language:"Ruby" },{:access_token => user.github_access_token}, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    it 'does not have something in the body if the language is incorrect' do
      get :index, {language:"javascript"},{:access_token => user.github_access_token}, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(0)
    end


  end


  describe 'GET#issues' do

    let!(:user) {create(:user)}
    let!(:repo) {create(:repo)}

    # Can't test without adding ENV variables to Travis
    # it 'responds with a 200 when a repo is passed' do
    #   id = Repo.first.id
    #   get :issues, {id: id},{:access_token => user.github_access_token}
    #   expect(response).to be_success
    # end

    it 'responds with 404 when an incorrect repo is passed' do
      expect{get :issues, {id: 437},{:access_token => user.github_access_token}}.to raise_error
    end

  end


end
