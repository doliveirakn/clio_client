require 'spec_helper'

describe ClioClient::Api::Contact do
  let(:session) { double("ClioClient::Api::Session") }
  subject {
    ClioClient::Api::Contact.new(session)
  }

  context "of type Company" do
    let(:type_value) { "Company" }
    let(:type_klass) { ClioClient::Company }
    include_examples "typed resource"
  end

  context "of type Person" do
    let(:type_value) { "Person" }
    let(:type_klass) { ClioClient::Person }
    include_examples "typed resource"
  end


end
