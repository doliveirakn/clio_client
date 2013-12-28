module ClioClient
  class CustomFieldPicklistValue < CustomFieldValue

    self.attributes[:value] = {type: :int}

    has_association :custom_field_picklist_option, ClioClient::CustomFieldPicklistOption

  end
end
