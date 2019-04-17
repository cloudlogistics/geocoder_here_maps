require 'geocoder'
require "geocoder_here_maps/version"
require "geocoder/lookups/here_suggest"
require "geocoder/results/here_suggest"

module GeocoderHereMaps
  class << self
    def load
      Geocoder::Lookup.street_services += [:here_suggest]
    end
  end

  class Error < StandardError; end
end

GeocoderHereMaps.load
