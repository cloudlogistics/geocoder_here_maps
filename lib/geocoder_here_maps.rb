require 'geocoder'
require "geocoder_here_maps/version"

require "geocoder/lookups/here_suggest"
require "geocoder/results/here_suggest"

require "geocoder/lookups/here_calculate_route"
require "geocoder/results/here_calculate_route"

module GeocoderHereMaps
  class << self
    def load
      Geocoder::Lookup.street_services += %i[here_suggest here_calculate_route]
    end
  end

  class Error < StandardError; end
end

GeocoderHereMaps.load
