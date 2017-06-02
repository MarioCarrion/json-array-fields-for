# frozen_string_literal: true
require 'rails_helper'

describe 'articles/show', type: :view do
  before do
    controller.singleton_class.class_eval do
      protected
      def article
        Article.create!(name:        'Name',
                        description: 'Description')
      end
      helper_method :article
    end
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
