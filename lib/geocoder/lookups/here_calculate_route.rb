module Geocoder::Lookup
  class HereCalculateRoute < Base
    def name
      "HereCalculateMatrix"
    end

    def required_api_key_parts
      ["app_id", "app_code"]
    end

    private

    def base_query_url(query)
      "#{protocol}://route.api.here.com/routing/7.2/calculateroute.json?"
    end

    def results(query)
      return [] unless doc = fetch_data(query)
      return [] unless doc["response"]["route"]

      r = doc["response"]["route"]

      if r.is_a?(Array)
        return r
      else
        return []
      end
    end

    def query_url_here_options(query)
      options = {
        app_id: api_key,
        app_code: api_code,
        language: (query.language || configuration.language)
      }
    end

    def query_url_params(query)
      super.merge(query_url_here_options(query)).merge(
        mode: query.sanitized_text
      )
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
  end
end
