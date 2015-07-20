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

    it 'has something in the body' do
      create(:repo)
      get :index, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    it 'has something in the body if the language is correct' do
      create(:repo)
      get :index, {language:"ruby"}, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    it 'does not have something in the body if the language is incorrect' do
      create(:repo)
      get :index, {language:"javascript"}, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(0)
    end


  end


  describe 'GET#issues' do

    it 'responds with a 200 when a repo is passed' do
      create(:repo)
      id = Repo.first.id
      get :issues, {id: id}
      expect(response).to be_success
    end

    it 'responds with 404 when an incorrect repo is passed' do
      create(:repo)
      expect{get :issues, {id: 437}}.to raise_error
    end

  end


end
