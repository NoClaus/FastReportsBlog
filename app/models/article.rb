# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 50 }
  validates :photo,
            size: { less_than_or_equal_to: 5.megabyte },
            content_type: %i[png]
end
