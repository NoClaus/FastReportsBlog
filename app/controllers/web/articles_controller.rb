# frozen_string_literal: true

class Web::ArticlesController < ApplicationController
  def index
    @time_at = Time.now
    @articles = Article.where("exclusion_date < ?", @time_at)
                       .order(created_at: :desc)
                       .page
  end

  def show
    @article = Article.find_by(params[:id])
  end
end
