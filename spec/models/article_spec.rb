# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_attached_of(:photo) }
    it { is_expected.to validate_content_type_of(:photo).allowing('image/png', 'image/jpg', 'image/jpeg') }
    it { is_expected.to validate_size_of(:photo).less_than(5.megabyte) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(50) }
  end
end