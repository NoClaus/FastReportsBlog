# frozen_string_literal: true

class Web::ArticlesController < ApplicationController
  def index
    @articles = Article.all
                       .where('created_at > exclusion_date')
                       .order(created_at: :desc)
                       .page
  end

  def show
    @article = Article.find_by(params[:id])
  end
end
