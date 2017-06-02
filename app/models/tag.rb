# frozen_string_literal: true
class Tag
  include ActiveModel::Model

  attr_accessor :name

  validates :name, length: { maximum: 5, allow_blank: true }

  def marked_for_destruction?
    false
  end
end
