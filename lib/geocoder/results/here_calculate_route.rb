module Geocoder::Result
  class HereCalculateRoute
    # data (hash) fetched from geocoding service
    attr_accessor :data

    # true if result came from cache, false if from request to geocoding
    # service; nil if cache is not configured
    attr_accessor :cache_hit

    ##
    # Takes a hash of data from a parsed geocoding service response.
    #
    def initialize(data)
      @data = data
      @cache_hit = nil
    end

    def waypoint
      @data['waypoint']
    end

    def leg
      @data['leg']
    end

    def maneuver
      leg['maneuver']
    end

    def mode
      @data['mode']
    end

    def distance
      summary_data['distance']
    end

    def travel_time
      summary_data['travelTime']
    end

    def traffic_time
      summary_data['trafficTime']
    end

    def base_time
      summary_data['baseTime']
    end

    private # ----------------------------------------------------------------

    def summary_data
      @data['summary']
    end
  end
end
