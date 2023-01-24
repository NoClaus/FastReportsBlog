# frozen_string_literal: true

class Web::ArticlesController < ApplicationController
  def index
    @articles = Article.all
                       .order(created_at: :desc)
                       .page                   
  end

  def show
    @article = Article.find_by(params[:id])
  end
end
