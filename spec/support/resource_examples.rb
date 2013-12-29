shared_examples "association" do
  
  let(:params) { { attribute => {"id" => 1, "name" => "name" } } }

  it "should convert attributes to a clio object" do
    expect(subject[attribute]).to be_kind_of klass
    expect(subject[attribute].id).to eql 1    
    expect(subject[attribute].name).to eql "name"
  end

  describe "#to_params" do
    it "should include the association" do
      p = subject.to_params
      expect(p["#{attribute}_id".intern]).to eql 1
    end
  end

end
