# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    
  end
end
