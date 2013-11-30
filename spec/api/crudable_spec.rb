require 'spec_helper'

describe ClioClient::Api::Crudable do
  let(:session) { double("ClioClient::Api::Session") }
  subject { 
    d = DummyEndpoint.new(session)
    d.extend(ClioClient::Api::Crudable)
    d
  }

  describe "#new" do    
    it "returns the correct data items" do
      record = subject.new({ int: "1" })
      expect(record).to be_kind_of TestRecord
      expect(record.int).to eql 1
    end
  end

  describe "#create" do
    let(:params) { { string: "1" } }
    let(:response) do
      { "dummy" => { string: "1" } }
    end

    it "issues with create request" do
      session.stub(:post).with("test", {"dummy" => params}.to_json).and_return(response)
      record = subject.create(params)
      expect(record).to be_kind_of TestRecord
      expect(record.string).to eql "1"
    end
  end

  describe "#update" do
    let(:params) { { id: 1, string: "1" } }
    let(:response) do
      { "dummy" => { id: 1, string: "1" } }
    end

    it "issues with update request" do
      record = session.stub(:put).with("test/1", {"dummy" => params}.to_json).and_return(response)
      record = subject.update("1", params)
      expect(record).to be_kind_of TestRecord
      expect(record.string).to eql "1"
    end
  end

  describe "#destroy" do
    it "issues a delete request" do
      session.should_receive(:delete)
      subject.destroy(1)
    end
  end

end
