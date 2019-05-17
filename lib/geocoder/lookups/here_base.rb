module Geocoder::Lookup
  class HereBase < Base
    def required_api_key_parts
      ["app_id", "app_code"]
    end

    def name
      fail
    end

    private

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
