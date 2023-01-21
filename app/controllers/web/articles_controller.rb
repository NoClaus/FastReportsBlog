class Web::ArticlesController < ApplicationController

  def index
  end

  def show
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
  
end
