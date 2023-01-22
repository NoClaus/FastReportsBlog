# frozen_string_literal: true

class Article < ApplicationRecord
	validates :title, :body, presence: true
  validates :body, length: { minimum: 50 }
end
