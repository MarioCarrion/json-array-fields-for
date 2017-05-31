# frozen_string_literal: true
require 'simplecov'

SimpleCov.minimum_coverage 100

SimpleCov.start('rails') do
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/vendor/'

  add_group 'Models',      'app/models'
  #add_group 'Services',    'app/services'
  add_group 'Controllers', 'app/controllers'
  #add_group 'Validators',  'app/validators'
  #add_group 'Helpers',     'app/helpers'
  #add_group 'Forms',       'app/forms'
  #add_group 'Presenters',  'app/presenters'
  #add_group 'Serializers', 'app/serializers'
  #add_group 'Workers',     'app/workers'
end
