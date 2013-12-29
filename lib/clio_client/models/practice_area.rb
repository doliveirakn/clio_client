module ClioClient
  
  class PracticeArea < Resource
    
    set_attributes(id:                      {type: :int, readonly: true},
                   created_at:              {type: :datetime, readonly: true},
                   updated_at:              {type: :datetime, readonly: true},
                   name:                    {type: :string}
                   )

    private
    def api
      session.practice_areas
    end

  end

end
