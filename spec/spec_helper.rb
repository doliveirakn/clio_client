require 'clio_client'
require 'debugger'

require 'support/associated_resource'
require 'support/test_resource'
require 'support/inherited_resource'
require 'support/dummy_endpoint'
require 'support/resource_examples'

RSpec.configure do |config|
  config.filter_run_excluding :external => true
end
