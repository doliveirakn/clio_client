module ClioClient
  class Person < Contact

    def type; 'Person'; end

    has_association :company, ClioClient::Company

  end
end
