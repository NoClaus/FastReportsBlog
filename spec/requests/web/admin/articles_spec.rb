# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Web::Admin::Articles' do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  describe 'GET /index' do
    before { sign_in user }

    let(:articles) { create_list(:aticles, 5) }

    it 'renders a successful response' do
      get admin_articles_url
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before { sign_in user }

    it 'renders a successful response' do
      get admin_article_url(article)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    before { sign_in user }

    it 'renders a successful response' do
      get new_admin_article_url
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /edit' do
    before { sign_in user }

    it 'render a successful response' do
      get edit_admin_article_url(article)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    before { sign_in user }

    context 'with valid parameters' do
      it 'creates a new Article' do
        expect do
          post admin_articles_url, params: { article: attributes_for(:article) }
        end.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        post admin_articles_url, params: { article: attributes_for(:article) }
        expect(response).to redirect_to(admin_root_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Article' do
        expect do
          post admin_articles_url, params: { article: attributes_for(:article, :invalid) }
        end.not_to change(Article, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_articles_url, params: { article: attributes_for(:article, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    before { sign_in user  }

    context 'with valid parameters' do
      let(:article) { create(:article) }

      it 'updates the requested article' do
        patch admin_article_url(article), params: { article: attributes_for(:article, :new_attributes) }
        article.reload
      end

      it 'redirects to the article' do
        patch admin_article_url(article), params: { article: attributes_for(:article, :new_attributes) }
        article.reload
        expect(response).to redirect_to(article_url(article))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch admin_article_url(article), params: { article: attributes_for(:article, :invalid) }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    before { sign_in user }

    let!(:article) { create(:article) }

    it 'destroys the requested article' do
      expect do
        delete admin_article_url(article)
      end.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      delete admin_article_url(article)
      expect(response).to redirect_to(admin_root_path)
    end
  end
end
