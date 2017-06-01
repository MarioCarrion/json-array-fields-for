# frozen_string_literal: true
require 'rails_helper'

describe 'articles/edit', type: :view do
  let!(:article) do
    assign(:article,
           Article.create!(name:        'name',
                           description: 'description'))
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(article), 'post' do
      assert_select 'input[name=?]', 'article[name]'
      assert_select 'input[name=?]', 'article[description]'
    end
  end
end
