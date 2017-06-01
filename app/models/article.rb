# frozen_string_literal: true
class Article < Base
  validates :name, :description, presence: true
end
