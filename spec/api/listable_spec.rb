require 'spec_helper'

describe ClioClient::Api::Listable do
  let(:session) { double("ClioClient::Api::Session") }
  subject { 
    d = DummyEndpoint.new(session)
    d.extend(ClioClient::Api::Listable)
    d
  }

  describe "#find" do
    let(:response) do
      { "dummies" => [{ id: 1 }, { id: 2} ]}
    end
    
    it "should return the correct data items" do
      session.stub(:get).and_return(response)
      records = subject.list
      expect(records.count).to eql 2
      expect(records.first).to be_kind_of TestRecord
      expect(records.first.id).to eql 1
      expect(records.last.id).to eql 2
    end

  end

end
