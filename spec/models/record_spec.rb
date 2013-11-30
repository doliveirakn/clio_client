require 'spec_helper'

describe ClioClient::Record do

  subject { TestRecord.new(session, params) }
  let(:params) { {id: 1} }
  let(:session) { double("ClioClient::Session") }
  let(:api) { double("ClioClient::Api::Base") }
  before { subject.stub(:api).and_return(api) }
  
  describe "an integer field" do
    let(:params) { {int: "1"} }

    it "is converted to an integer on creation" do
      expect(subject.int).to be_kind_of Fixnum
    end

  end

  describe "a date field" do
    let(:params) { {date: "2013-12-01"} }

    it "is converted to an date on creation" do
      expect(subject.date).to be_kind_of Date
    end

  end

  describe "a datetime field" do
    let(:params) { {datetime: "2013-12-01 00:00:00"} }

    it "is converted to an datetime on creation" do
      expect(subject.datetime).to be_kind_of DateTime
    end

  end
  describe "a string field" do
    let(:params) { {string: "Hello"} }

    it "is converted to an string on creation" do
      expect(subject.string).to be_kind_of String
    end

  end

  describe "a boolean field" do
    let(:params) { {boolean: "true"} }

    it "is converted to an boolean on creation" do
      expect(subject.boolean).to be_kind_of TrueClass
    end

  end

  describe ".attributes" do
    context "for an inherited record" do
      it "is the same as the parent class" do
        expect(InheritedRecord.attributes).to eql TestRecord.attributes
      end
    end
  end

  describe "#save" do
    let(:to_params) { {special: :params} }
    before { subject.stub(:to_params).and_return(to_params) }
    context "when the record is new" do
      let(:params) { {} }
      it "makes a create call" do
        api.should_receive(:create).with(to_params)
        subject.save
      end
    end
    context "when the record has an id" do
      it "makes a update call" do
        api.should_receive(:update).with(subject.id, to_params)
        subject.save
      end
    end

  end

  describe "#reload" do

    context "when the record is not saved" do
      let(:params) { {} }
      it "raises an exception" do
        expect{subject.reload}.to raise_error ClioClient::RecordNotSaved
      end
    end
    context "when the record is saved" do
      it "should make a find call" do
        api.should_receive(:find).with(subject.id)
        subject.reload
      end
    end

  end

  describe "#destroy" do

    context "when the record is not saved" do
      let(:params) { {} }
      it "raises an exception" do
        expect{subject.destroy}.to raise_error ClioClient::RecordNotSaved
      end
    end
    context "when the record is saved" do
      it "should make a destroy call" do
        api.should_receive(:destroy).with(subject.id)
        subject.destroy
      end
    end

  end

end
