module ClioClient
  class CustomFieldUrlValue < CustomFieldValue

    self.attributes[:value] = {type: :string}

  end
end
