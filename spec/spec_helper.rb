require 'clio_client'
require 'debugger'

require 'support/associated_record'
require 'support/test_record'
require 'support/inherited_record'
require 'support/dummy_endpoint'

RSpec.configure do |config|
  config.filter_run_excluding :external => true
end
