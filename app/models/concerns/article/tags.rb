# frozen_string_literal: true
module Concerns
  module Article
    module Tags
      extend ActiveSupport::Concern

      included do
        validates :tags, associated: true
      end

      def tags
        @tags ||= add_missing_values(build_from_column)
      end

      def tags_attributes=(attributes)
        write_attribute(:json_tags, attributes.values)
      end

      private

      TAGS_LENGTH = 3

      def add_missing_values(array)
        (TAGS_LENGTH - array.length).times do
          array << Tag.new(name: nil)
        end
        array
      end

      def build_from_column
        [].tap do |array|
          json_tags.each do |tag|
            array << Tag.new(tag)
          end
        end
      end
    end # Tags
  end
end
