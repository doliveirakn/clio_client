module ClioClient
  
  class Communication < Record

    attr_accessor(:id, :type, :created_at, :updated_at, :subject, :body, :date, 
                  :matter, :senders, :receivers)

  end

end
