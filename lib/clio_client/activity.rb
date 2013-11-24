module ClioClient

  class Activity < Record

    attr_accessor(:id, :type, :date, :note, :price, 
                  :quanity, :total, :billed, :created_at, :updated_at)

    has_association :user,                 ClioClient::User
    has_association :matter,               ClioClient::Matter
    has_association :activity_description, ClioClient::ActivityDescription
    has_association :communication,        ClioClient::Communication
    
  end

end
