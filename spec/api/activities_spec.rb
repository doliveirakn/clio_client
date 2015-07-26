require 'spec_helper'

describe ClioClient::Api::Activity do
  let(:session) { double("ClioClient::Api::Session") }
  subject {
    ClioClient::Api::Activity.new(session)
  }

  context "of type TimeEntry" do
    let(:type_value) { "TimeEntry" }
    let(:type_klass) { ClioClient::TimeEntry }

    include_examples "typed resource"
  end

  context "of type ExpenseEntry" do
    let(:type_value) { "ExpenseEntry" }
    let(:type_klass) { ClioClient::ExpenseEntry }

    include_examples "typed resource"
  end
end
