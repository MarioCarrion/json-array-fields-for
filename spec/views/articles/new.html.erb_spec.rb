# frozen_string_literal: true
require 'rails_helper'

describe 'articles/new', type: :view do
  let!(:article) do
    assign(:article,
           Article.new(name:        'name',
                       description: 'description'))
  end

  it 'renders new article form' do
    render

    assert_select 'form[action=?][method=?]', articles_path, 'post' do
      assert_select 'input[name=?]', 'article[name]'
      assert_select 'input[name=?]', 'article[description]'
    end
  end
end
