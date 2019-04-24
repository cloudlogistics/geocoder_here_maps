module Geocoder::Result
  class HereCalculateMatrix < Base

    def initialize(data)
      binding.pry
      @data = data
      @cache_hit = nil
    end

    def address(format = :full)
      @data['label']
    end

    ##
    # A two-element array: [lat, lon].
    #
    def coordinates
      fail
    end

    def country
      address_data['country']
    end

    def state
      address_data['state']
    end

    def county
      address_data['county']
    end

    def city
      address_data['city']
    end

    def postal_code
      address_data['postalCode']
    end

    def location_id
      @data['locationId']
    end

    private # ----------------------------------------------------------------

    def address_data
      @data['address'] || fail
    end
  end
end
