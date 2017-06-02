# frozen_string_literal: true
class RenameTagsColumnToJsonTagsFromArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :tags, :json_tags
  end
end
