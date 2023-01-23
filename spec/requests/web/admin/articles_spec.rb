# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Web::Admin::Articles' do
  it 'creates Article and redirect to Article page' do
    get 'admin/article/new'

    expect(response).to render_template(:new)
  end
end
