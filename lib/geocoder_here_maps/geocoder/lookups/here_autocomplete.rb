module GeocoderHereMaps
  class Geocoder::Lookup::HereAutocomplete < Geocoder::Lookup::Here
    def name
      "HereAutocomplete"
    end

    def query_url(query)
     base_query_url(query) + url_query_string(query)
    end

    private

    def base_query_url(query)
      "#{protocol}://autocomplete.geocoder.api.here.com/6.2/suggest.json?"
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

      unless (country = query.options[:country]).nil?
        options[:country] = country
      end

      unless (mapview = query.options[:bounds]).nil?
        options[:mapview] = mapview.map{ |point| "%f,%f" % point }.join(';')
      end
      options
    end

    def query_url_params(query)
      super.merge(query_url_here_options(query)).merge(
        query: query.sanitized_text
      )
    end
  end
end
