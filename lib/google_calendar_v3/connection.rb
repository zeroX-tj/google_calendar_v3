# (c) 2012 Wep'IT bvba
module GoogleCalendarV3
  class InvalidTokenException < Exception;end
  class NotFoundException < Exception;end
  class Connection
    include HTTParty
    base_uri "https://www.googleapis.com/calendar/v3"

    def initialize(token)
      @token = token
    end
    
    def authenticated_get(url)
      @response = self.class.get(url,:headers => {"Authorization" => "Bearer #{self.token}"} )
      case response.code 
      when 200 
        return response
      when 401
        raise InvalidTokenException.new(error_message)
      when 404
        raise NotFoundException.new('not found')
      else
        raise "unknown exception"
      end
    end
    
    def error_message
      return unless @response
      if @response.parsed_response.has_key?('error')
        @response.parsed_response['error']['message'] 
      else
        @response.body
      end
    end
    
    def token
      @token
    end
  end
end
