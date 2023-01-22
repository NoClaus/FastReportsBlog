# frozen_string_literal: true

class Web::ArticlesController < ApplicationController
  def index
    @articles = Article.all
                       .order(created_at: :desc)  
                       .page(page)
                       .per(per_page)
  end

  def show
    @article = Article.find_by(params[:id])
    redirect_to(@link.url)
  end
end
