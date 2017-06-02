# frozen_string_literal: true
require 'rails_helper'

describe 'articles/new', type: :view do
  before do
    controller.singleton_class.class_eval do
      protected
      def article
        Article.new(name:        'name',
                    description: 'description')
      end
      helper_method :article
    end
  end

  it 'renders new article form' do
    render

    assert_select 'form[action=?][method=?]', articles_path, 'post' do
      assert_select 'input[name=?]', 'article[name]'
      assert_select 'input[name=?]', 'article[description]'
    end
  end
end
