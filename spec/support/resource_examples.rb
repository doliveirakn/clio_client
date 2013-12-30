shared_examples "association" do
  
  let(:nested_params) do
    {"id" => 1, "name" => "name" }.merge(association_params)
  end
  let(:params) do
    { attribute => nested_params }
  end

  it "should convert attributes to a clio object" do
    obj = model[attribute]
    expect(obj).to be_kind_of klass
    nested_params.each_pair do |k, v|
      expect(obj[k]).to eql v if v && k != "type"
    end
  end

  describe "#to_params" do
    it "should include the association" do
      p = model.to_params
      expect(p["#{attribute}_id".intern]).to eql 1
    end
  end

end

shared_examples "has many association" do
  let(:nested_params) do
    {"id" => 1, "name" => "name" }.merge(association_params)
  end
  let(:params) do
    { attribute => [nested_params] }
  end

  it "should convert attributes to a clio object" do
    obj = model[attribute].first
    expect(obj).to be_kind_of klass
    nested_params.each_pair do |k, v|
      expect(obj[k]).to eql v if v && k != "type"
    end
  end

  describe "#to_params" do
    it "should include the associations" do
      obj = model[attribute].first
      p = obj.to_params
      expect(model.to_params[attribute]).to eql [p]
    end
  end

end
