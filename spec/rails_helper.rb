# frozen_string_literal: true
require 'spec_helper'
require 'rspec/rails'
require 'rails/all'

require 'support/factory_girl'
require 'support/shoulda_matchers'

Dir[Rails.root.join('spec/shared_examples/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure(&:infer_spec_type_from_file_location!)
