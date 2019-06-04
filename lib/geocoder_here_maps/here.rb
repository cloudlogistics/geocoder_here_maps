require "geocoder/lookups/here"

module Geocoder::Lookup
  Here.class_eval do
    include DefaultLookupMethods

    private

    def base_query_url(query)
      "#{protocol}://#{if query.reverse_geocode? then 'reverse.' end}geocoder.#{domain}/6.2/#{if query.reverse_geocode? then 'reverse' end}geocode.json?"
    end
  end
end
