require 'geocoder'
require "geocoder_here_maps/version"

require "geocoder/lookups/here_suggest"
require "geocoder/results/here_suggest"

require "geocoder/lookups/here_calculate_matrix"
require "geocoder/results/here_calculate_matrix"

module GeocoderHereMaps
  class << self
    def load
      Geocoder::Lookup.street_services += %i[here_suggest here_calculate_matrix]
    end
  end

  class Error < StandardError; end
end

GeocoderHereMaps.load
