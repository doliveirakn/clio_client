module ClioClient
  class CustomFieldTextAreaValue < CustomFieldValue

    self.attributes[:value] = {type: :string}

  end
end
