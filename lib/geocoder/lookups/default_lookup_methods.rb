module Geocoder::Lookup
  module DefaultLookupMethods
    extend ActiveSupport::Concern

    def handle
      :here
    end

    def required_api_key_parts
      ["app_id", "app_code"]
    end

    private

    def query_url_here_options(query)
      options = {
        app_id: api_key,
        app_code: api_code,
        language: (query.language || configuration.language)
      }
    end

    def api_key
      if (a = configuration.api_key)
        return a.first if a.is_a?(Array)
      end
    end

    def api_code
      if (a = configuration.api_key)
        return a.last if a.is_a?(Array)
      end
    end

    def domain
      if configuration.cit
        'cit.api.here.com'
      else
        'api.here.com'
      end
    end
  end
end
