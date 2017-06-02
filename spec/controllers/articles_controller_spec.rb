# frozen_string_literal: true
require 'rails_helper'

describe ArticlesController, type: :controller do
  let(:valid_attributes)   { { name: 'name', description: 'description' } }
  let(:invalid_attributes) { { name: nil,    description: nil } }

  describe 'GET #index' do
    let!(:article) { create(:article, valid_attributes) }

    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_success
    end

    describe 'view rendering' do
      render_views

      it 'renders the index template' do
        get :index
        expect(response.body).to include('Articles')
      end
    end # view rendering
  end # GET #index

  describe 'GET #show' do
    let!(:article) { create(:article, valid_attributes) }

    it 'returns a success response' do
      get :show, params: { id: article.to_param }
      expect(response).to be_success
    end
  end # GET #show

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_success
    end

    describe 'view rendering' do
      render_views

      it 'renders the new template' do
        get :new
        expect(response.body).to include('New Article')
      end
    end # view rendering
  end # GET #new

  describe 'GET #edit' do
    let!(:article) { create(:article, valid_attributes) }

    it 'returns a success response' do
      get :edit, params: { id: article.to_param }
      expect(response).to be_success
    end
  end # GET #edit

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Article' do
        expect {
          post :create, params: { article: valid_attributes }
        }.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        post :create, params: { article: valid_attributes }
        expect(response).to redirect_to(Article.last)
      end
    end # with valid params

    context 'with invalid params' do
      subject { post :create, params: { article: invalid_attributes } }
      it 'renders new' do
        expect(subject).to render_template(:new)
      end
    end # with invalid params
  end # POST #create

  describe 'PUT #update' do
    context 'with valid params' do
      let!(:article) { create(:article, valid_attributes) }
      let(:new_attributes) { { name: 'new name', description: 'new description' } }

      it 'updates the requested article' do
        put :update, params: { id: article.to_param, article: new_attributes }

        article.reload

        expect(article.name).to eql 'new name'
        expect(article.description).to eql 'new description'
      end

      it 'redirects to the article' do
        put :update, params: { id: article.to_param, article: valid_attributes }
        expect(response).to redirect_to(article)
      end
    end

    context 'with invalid params' do
      let!(:article) { create(:article, valid_attributes) }

      subject { put :update, params: { id: article.to_param, article: invalid_attributes } }

      it 'renders edit' do
        expect(subject).to render_template(:edit)
      end
    end # with invalid params
  end # PUT #update

  describe 'DELETE #destroy' do
    let!(:article) { create(:article, valid_attributes) }

    it 'destroys the requested article' do
      expect {
        delete :destroy, params: { id: article.to_param }
      }.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      delete :destroy, params: { id: article.to_param }
      expect(response).to redirect_to(articles_url)
    end
  end # DELETE #destroy
end
