require 'rails_helper'

RSpec.describe "Web::Articles", type: :request do
  describe "GET /index" do
    get articles_path
  end

  describe "GET /show" do
    get article_path
  end
end
