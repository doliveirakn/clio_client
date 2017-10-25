require 'clio_client'

require 'support/associated_resource'
require 'support/test_resource'
require 'support/inherited_resource'
require 'support/dummy_endpoint'
require 'support/resource_examples'
require 'date' # Specs fail without

require 'rspec'
require 'rspec/core/shared_context'

module CommonLetHelpers
  extend RSpec::Core::SharedContext
  let(:session) { double("ClioClient::Session") }
  let(:params) { {} }
  let(:association_params) { {} }
  let(:model) { described_class.new(params, session) }
end


RSpec.configure do |config|
  config.filter_run_excluding :external => true
  config.include CommonLetHelpers
end
