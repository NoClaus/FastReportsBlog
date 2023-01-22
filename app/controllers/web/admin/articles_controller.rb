# frozen_string_literal: true

class Web::Admin::ArticlesController < ApplicationController
  def index; end

  def show; end

  def new
    @article = Article.new
  end

  def create; end

  def destroy; end

  private

  def article_params; end
end
