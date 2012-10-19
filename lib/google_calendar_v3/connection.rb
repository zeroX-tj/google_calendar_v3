# (c) 2012 Wep'IT bvba
module GoogleCalendarV3
  class InvalidTokenException < Exception;end
  class Connection
    include HTTParty
    base_uri "https://www.googleapis.com/calendar/v3"

    def initialize(token)
      @token = token
    end
    
    def authenticated_get(url)
      response = self.class.get(url,:headers => {"Authorization" => "Bearer #{self.token}"} )
      if response.code == 401
        if response.parsed_response.has_key?('error')
          error_message  = response.parsed_response['error']['message'] 
        else
          error_message = response.body
        end
        raise InvalidTokenException.new(error_message)
      end
      response
    end
    
    def token
      @token
    end
  end
end
