module GooglePlaces
  class DetailsSearch
    attr_accessor :key, :sensor, :reference

    def initialize(key: nil, sensor: false, reference: nil)
      unless key.present?
        throw 'YO DAWG WHERE DA KEYZ'
      end

      @key = key
      @sensor = sensor
      @reference = reference
      @retry_count = 0
    end

    def url
      URI::encode("https://maps.googleapis.com/maps/api/place/details/json?key=#{key}&sensor=#{sensor}&reference=#{reference}")
    end

    def search
      begin
        response = JSON.load(open(url))
        @retry_count = 0
        response['result']
      rescue
        if @retry_count < 5
          puts 'DETAIL SEARCH: Something went wrong, retrying.'
          @retry_count += 1
          search
        else
          throw 'fuck it, retried too many times'
        end
      end
    end
  end
end
