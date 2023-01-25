class AddDatatimeToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :exclusion_date, :timestamp
  end
end
