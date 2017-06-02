# frozen_string_literal: true
class Article < Base
  include Concerns::Article::Tags

  validates :name, :description, presence: true
end
