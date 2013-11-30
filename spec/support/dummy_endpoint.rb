class DummyEndpoint < ClioClient::Api::Base
  include ClioClient::Api::Findable

  def data_item(params)
    TestRecord.new(session, params)
  end
  
  def singular_resource; 'dummy'; end
  def plural_resource; 'dummies'; end
  def end_point_url; 'test'; end
end
