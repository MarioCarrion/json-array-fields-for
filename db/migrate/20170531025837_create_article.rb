class CreateArticle < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name,        limit:   100
      t.string :description, limit:   200
      t.jsonb  :tags,        default: []
    end
  end
end
