# (c) 2012 Wep'IT bvba
module GoogleCalendarV3
  class Event
    attr_accessor :kind, :etag, :status, :summary, :creator, :organizer, :start,:stop, :id,:description, :location, :sequence, :reminders
    def initialize(params={})
      self.kind      = params['kind']
      self.etag      = params['etag']
      self.id        = params['id']
      self.status    = params['status']
      self.summary   = params['summary']
      self.creator   = params['creator']
      self.organizer = params['organizer']
      self.start     = params['start']
      self.stop      = params['end']
      self.description = params['description']
      self.location  = params['location']
      self.sequence  = params['sequence']
      self.reminders = params['reminders']
    end
  end
end
