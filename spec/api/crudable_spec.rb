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
      expect(record).to be_kind_of TestResource
      expect(record.int).to eql 1
    end
  end

  describe "#create" do
    let(:params) { { string: "1" } }
    let(:response) do
      { "dummy" => { string: "1" } }
    end
    let(:inline_error_response) do
      { "errors" => { "base" => ["Something went wrong"] } }
    end

    it "issues with create request" do
      session.stub(:post).with("test", {"dummy" => params}.to_json).and_return(response)
      record = subject.create(params)
      expect(record).to be_kind_of TestResource
      expect(record.string).to eql "1"
    end

    context "when errors are returned" do
      it "should parse them inline" do
        session.stub(:post).with("test", {"dummies" => [params, params]}.to_json).and_return({"dummies" => [response["dummy"], inline_error_response]})
        records = subject.create([params, params])
        expect(records[0]).to be_kind_of TestResource
        expect(records[0].string).to eql "1"

        expect(records[1]).to be_kind_of Hash
        expect(records[1]["errors"]["base"][0]).to eql "Something went wrong"
      end
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
      expect(record).to be_kind_of TestResource
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
