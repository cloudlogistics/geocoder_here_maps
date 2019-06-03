module Geocoder::Lookup
  class HereSuggest < Geocoder::Lookup::HereBase
    def name
      "HereSuggest"
    end

    private

    def base_query_url(query)
      "#{protocol}://autocomplete.geocoder.#{domain}/6.2/suggest.json?"
    end

    def results(query)
      return [] unless doc = fetch_data(query)
      return [] unless doc['suggestions']

      r = doc['suggestions']

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
        query: query.sanitized_text
      )
    end
  end
end
