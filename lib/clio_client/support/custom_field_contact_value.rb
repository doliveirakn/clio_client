module ClioClient
  class CustomFieldContactValue < CustomFieldValue

    self.attributes[:value] = {type: :int}
    
    has_association :contact, ClioClient::Contact

    def contact=(attributes)
      accepted_types = %w(Person Company)
      if accepted_types.include? attributes["type"]
        klass = ClioClient.const_get attribute["type"].intern
        obj = klass.new(attributes, session)
        write_attribute("contact", obj)
      end
    end


  end
end
