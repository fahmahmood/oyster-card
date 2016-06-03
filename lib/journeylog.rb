require 'oystercard'
require 'journey'

class JourneyLog

attr_reader :log

def initialize(journey=Journey.new)
@log = []
@journey = journey
end 

def start(station)
@journey.start(station)
end

def finish(station)
@journey.finish(station)
@log << @journey
end  

def fare
@journey.fare
end 

end 