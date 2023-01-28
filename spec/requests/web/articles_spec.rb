# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Web::Articles' do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get articles_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get article_url(article)
      expect(response).to render_template(:show)
    end
  end
end
