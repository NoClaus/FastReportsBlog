# frozen_string_literal: true

class Web::ArticlesController < ApplicationController
  def index
    @time = Time.now
    @articles = Article.all
                       .where("exclusion_date < ?", @time)
                       .order(created_at: :desc)
  end

  def show
    @article = Article.find_by(params[:id])
  end
end
