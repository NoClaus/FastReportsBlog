# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Web::Homepages' do
  describe 'GET /index' do
    it 'renders a successful response' do
      get articles_url
      expect(response).to be_successful
    end
  end
end
