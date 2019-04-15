require 'geocoder'
require "geocoder_here_maps/version"
require "geocoder_here_maps/geocoder/lookups/here_autocomplete"
require "geocoder_here_maps/geocoder/results/here_autocomplete"

module GeocoderHereMaps
  class << self
    def load
      Geocoder::Lookup.street_services.push(:here_autocomplete)
    end
  end

  class Error < StandardError; end
end

GeocoderHereMaps.load
