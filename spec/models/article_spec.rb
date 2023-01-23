# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should have_one_attached(:photo) }
    it { should validate_content_type_of(:photo).allowing('image/png') }
    it { should validate_size_of(:photo).less_than_or_equal_to(5.megabyte) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(50) }
  end
end
