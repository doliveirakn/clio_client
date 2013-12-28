module ClioClient
  class CustomFieldCheckboxValue < CustomFieldValue

    self.attributes[:value] = {type: :boolean}

  end
end
