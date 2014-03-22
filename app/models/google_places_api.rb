require 'open-uri'

class GooglePlacesApi
  attr_accessor :lat, :long, :radius, :types, :sensor, :keyword, :key

  def initialize(lat: 29.9667, long: -90.0500, radius: 10000, types: ['bar'], sensor: false, keyword: nil, key: nil)
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
  end

  def radar_url_base
    "https://maps.googleapis.com/maps/api/place/radarsearch/json?key=#{key}&sensor=#{sensor}"
  end


  def radar_url
    URI::encode("#{radar_url_base}&location=#{lat},#{long}&radius=#{radius}&types=#{types.join('|')}")
  end

  def details_url(reference)
    URI::encode("https://maps.googleapis.com/maps/api/place/details/json?key=#{key}&sensor=#{sensor}&reference=#{reference}")
  end

  def dump_to(file)
    results = []
    response = JSON.load(open(radar_url))

    response['results'].each do |result|
      puts result['reference']

      details_response = JSON.load(open(details_url(result['reference'])))
      results << details_response['result']
    end

    puts results.count

    File.open(file, 'w') { |f| f.write JSON.pretty_generate(results) }
  end
end
