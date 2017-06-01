# frozen_string_literal: true
require 'rails_helper'

describe 'articles/index', type: :view do
  before(:each) do
    assign(:articles,
           [Article.create!(name:        'Name',
                            description: 'Description'),
            Article.create!(name:        'Name',
                            description: 'Description')])
  end

  it 'renders a list of articles' do
    render
    assert_select 'tr>td', text: 'Name',        count: 2
    assert_select 'tr>td', text: 'Description', count: 2
  end
end
