# frozen_string_literal: true
require 'rails_helper'

describe 'articles/show', type: :view do
  let!(:article) do
    assign(:article,
           Article.create!(name:        'Name',
                           description: 'Description'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
