# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def page
    params.fetch(:page, 1)
  end

  def per_page
    params.fetch(:per_page, 10)
  end
end
