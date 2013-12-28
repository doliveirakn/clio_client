module ClioClient
  class CustomFieldContactValue < CustomFieldValue

    self.attributes[:value] = {type: :int}
    
    has_association(:contact, ClioClient::Contact, :polymorphc => true, 
                    :accepted_types => %w(Person Company))

  end
end
