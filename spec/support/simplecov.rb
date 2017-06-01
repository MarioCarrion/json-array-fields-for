# frozen_string_literal: true
require 'simplecov'

SimpleCov.minimum_coverage 100

SimpleCov.start('rails') do
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/vendor/'

  add_group 'Models',      'app/models'
  add_group 'Controllers', 'app/controllers'
end
