# frozen_string_literal: true
require 'rails_helper'

describe 'articles/index', type: :view do
  before do
    controller.singleton_class.class_eval do
      protected

      def articles
        [Article.create!(name:        'Name',
                         description: 'Description'),
         Article.create!(name:        'Name',
                         description: 'Description')]
      end
      helper_method :articles
    end
  end

  it 'renders a list of articles' do
    render
    assert_select 'tr>td', text: 'Name',        count: 2
    assert_select 'tr>td', text: 'Description', count: 2
  end
end
