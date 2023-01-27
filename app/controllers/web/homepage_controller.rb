# frozen_string_literal: true

class Web::HomepageController < ApplicationController
  def index
    @time = Time.now
    @articles = Article.all
                       .where("exclusion_date < ?", @time)
                       .order(created_at: :desc)
                       .limit(3)  
                       .page(6)  
  end
end
