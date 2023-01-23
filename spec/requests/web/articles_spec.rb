# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Web::Articles' do
  let (:user) { create(:user) }
  let (:article) { build_stubbed(:article, user: :user)}

  it "" do
    expect(response).to render_template(:index)
  end

  it "" do
    expect(response).to render_template(:show)
  end

end
