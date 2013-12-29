require 'spec_helper'

describe ClioClient::Api::Findable do
  let(:session) { double("ClioClient::Api::Session") }
  subject { 
    d = DummyEndpoint.new(session)
    d.extend(ClioClient::Api::Findable)
    d
  }

  describe "#find" do
    let(:response) do
      { "dummy" => { "id" => 1 }}
    end
    
    it "should return the correct data item" do
      session.stub(:get).and_return(response)
      dummy = subject.find(1)
      expect(dummy).to be_kind_of TestResource
      expect(dummy.id).to eql 1
    end

  end

end
