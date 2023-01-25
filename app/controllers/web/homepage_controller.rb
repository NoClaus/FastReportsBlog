# frozen_string_literal: true

class Web::HomepageController < ApplicationController
  def index
    @articles = Article.all
                       .where('created_at > exclusion_date')
                       .order(created_at: :desc)
                       .limit(3)
  end
end
