# frozen_string_literal: true

class Web::Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
                       .order(created_at: :desc)
                       .page
  end

  def show
    @article = Article.find_by(params[:id])
    redirect_to admin_article_path
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build article_params

    if @article.save
      redirect_to @article, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    change_state(@article)
    if @article.update article_params
      redirect_to @article, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :photo)
  end
end
