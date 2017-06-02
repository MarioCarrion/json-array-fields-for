# frozen_string_literal: true
require 'rails_helper'

describe 'articles/edit', type: :view do
  before do
    controller.singleton_class.class_eval do
      protected

      def article
        Article.find(999)
      end
      helper_method :article
    end
  end

  let!(:article) do
    Article.create!(id:          999,
                    name:        'name',
                    description: 'description')
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(article), 'post' do
      assert_select 'input[name=?]', 'article[name]'
      assert_select 'input[name=?]', 'article[description]'
    end
  end
end
