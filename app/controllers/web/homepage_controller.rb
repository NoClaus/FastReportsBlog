# frozen_string_literal: true

class Web::HomepageController < ApplicationController
  def index
    @articles = Article.all
                       .order(created_at: :desc)
                       .limit(3)
  end
end
