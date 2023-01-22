# frozen_string_literal: true

class Web::ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show; end
end
