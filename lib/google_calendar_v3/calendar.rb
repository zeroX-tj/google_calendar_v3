# (c) 2012 Wep'IT bvba
module GoogleCalendarV3
  class Calendar   
    attr_accessor :kind,:etag,:id,:summary,:description,:location,:timezone
       
    def initialize(params={}, connection = nil)
      self.kind     = params["kind"]
      self.etag     = params["etag"]
      self.id       = params["id"]
      self.summary  = params["summary"]
      self.description = params["description"]
      self.location    = params["location"]
      self.timezone    = params["timeZone"]
      @connection = connection
    end
  
    def events(options={})
      @events = retrieve_events(options)   
    end
      
    def self.list(token)
      connection = GoogleCalendarV3::Connection.new(token)
      response = connection.authenticated_get("/users/me/calendarList")
      response.parsed_response['items'].map{|x| new(x,connection)}
    end
  
    private   
    def retrieve_events(options)
      raise "InvalidConnectionException" unless @connection.is_a?(GoogleCalendarV3::Connection)
      options_string = encode_options(options)
      url = "/calendars/#{id}/events?#{options_string}"
      response = @connection.authenticated_get(url)
      return [] unless response.parsed_response.has_key?('items')
      response.parsed_response['items'].map{|x| GoogleCalendarV3::Event.new(x)}
    end
    
    def encode_options(options)
      checked_options = check_options(options)
      checked_options.map{|k,v| "#{k}=#{CGI::escape(v.to_s)}"}.join('&')
    end
    
    def check_options(options)
      options.each do |key, value|
        if key.to_sym == :timeMin || key.to_sym == :timeMax
          raise "#{key} should be a date or time object" unless value.kind_of?(Time) || value.kind_of?(Date)
          options[key] = value.as_json
        end
      end
      options
    end
    
  end
end
