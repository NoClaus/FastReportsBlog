# frozen_string_literal: true

class Web::HomepageController < ApplicationController
  def index
    @time_at = Time.now
    @articles = Article.where("exclusion_date < ?", @time_at)
                       .order(created_at: :desc)
                       .limit(3)  
                                          
  end
end
