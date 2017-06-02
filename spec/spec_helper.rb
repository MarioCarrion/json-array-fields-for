# frozen_string_literal: true
ENV['RAILS_ENV'] = 'test'

require_relative 'support/simplecov'
require File.expand_path('../../config/environment', __FILE__)

Bundler.require(:default, :test)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random

  config.before(:suite) do
    DatabaseCleaner[:active_record, { model: Base }].clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner[:active_record, { model: Base }].strategy = :truncation
    DatabaseCleaner[:active_record, { model: Base }].start
  end

  config.after(:each) do
    DatabaseCleaner[:active_record, { model: Base }].clean
  end
end
