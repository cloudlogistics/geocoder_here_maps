module Geocoder::Lookup
  class HereCalculateRoute < Geocoder::Lookup::HereBase
    def name
      "HereCalculateRoute"
    end

    private

    def base_query_url(query)
      "#{protocol}://route.#{domain}/routing/7.2/calculateroute.json?"
    end

    def results(query)
      return [] unless doc = fetch_data(query)
      return [] unless doc["response"] && doc["response"]["route"]

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
        waypoints_hash(query.to_param)
      )
    end

    def waypoints_hash(waypoints)
      waypoints.each_with_object({}).with_index do |(point, hash), index|
        hash["waypoint#{index}"] = point.join(',')
      end
    end
  end
end
