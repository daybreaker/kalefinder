module GooglePlaces
  class RadarSearch
    attr_accessor :lat, :long, :radius, :types, :sensor, :keyword, :key, :minprice, :maxprice

    def initialize(lat: 29.9667, long: -90.0500, radius: 10000, types: ['bar'], sensor: false, keyword: nil, key: nil, minprice: 0, maxprice: 4)
      unless key.present?
        throw 'YO DAWG WHERE DA KEYZ'
      end

      @lat = lat
      @long = long
      @radius = radius
      @types = types
      @sensor = sensor
      @keyword = keyword
      @key = key
      @minprice = minprice
      @maxprice = maxprice
      @retry_count = 0
    end

    def url
      URI::encode("https://maps.googleapis.com/maps/api/place/radarsearch/json?key=#{key}&sensor=#{sensor}&location=#{lat},#{long}&radius=#{radius}&types=#{types.join('|')}&minprice=#{minprice}&maxprice=#{maxprice}")
    end

    def search
      results = []
      begin
        response = JSON.load(open(url))
        @retry_count = 0
        response['results']
      rescue
        if @retry_count < 5
          puts 'RADAR SEARCH: Something went wrong, retrying.'
          @retry_count += 1
          search
        else
          throw 'fuck it, retried too many times'
        end
      end
    end
  end
end
