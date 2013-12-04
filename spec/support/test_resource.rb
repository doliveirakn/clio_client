class TestResource < ClioClient::Resource
  
  set_attributes(id:       {type: :int},
                 int:      {type: :int},
                 date:     {type: :date},
                 datetime: {type: :datetime},
                 string:   {type: :string},
                 boolean:  {type: :boolean}
                 )

end
