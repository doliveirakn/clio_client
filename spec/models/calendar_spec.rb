require 'spec_helper'

describe ClioClient::Activity do

  let(:session) { double("ClioClient::Session") }

  subject { ClioClient::Activity.new(params, session) }

end
