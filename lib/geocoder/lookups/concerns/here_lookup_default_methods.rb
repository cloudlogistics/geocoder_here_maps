module Geocoder::Lookup
  module HereLookupDefaultMethods
    extend ActiveSupport::Concern

    def handle
      :here
    end

    def required_api_key_parts
      ["app_key"]
    end

    def supported_protocols
      [:https]
    end

    private

    def query_url_here_options(query)
      options = {
        api_key: configuration.api_key,
        language: (query.language || configuration.language)
      }
    end

    def domain
      'ls.hereapi.com'
    end
  end
end
