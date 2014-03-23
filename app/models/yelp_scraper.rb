class YelpScraper
  include Yelp::V2::Search::Request
  attr_accessor :sw_lat, :sw_long, :ne_lat, :ne_long, :city, :keyword, :client

  def initialize(sw_lat:nil,sw_long:nil,ne_lat:nil,ne_long:nil, city:"New Orleans", keyword: nil)
    @ne_lat = ne_lat
    @ne_long = ne_long
    @sw_lat = sw_lat
    @sw_long = sw_long
    @city = city
    @keyword = keyword
    
    Yelp.configure(
               :consumer_key    => ENV["YELP_CONSUMER_KEY"],
               :consumer_secret => ENV['YELP_CONSUMER_SECRET'],
               :token           => ENV['YELP_TOKEN'],
               :token_secret    => ENV['YELP_TOKEN_SECRET'])

    @client = Yelp::Client.new
  end
  # search for businesses via location (address, neighbourhood, city, state, zip, country, latitude, longitude)'
  def scrape
    request = BoundingBox.new(
            :term => keyword,
            :sw_latitude => sw_lat,
            :sw_longitude => sw_long,
            :ne_latitude => ne_lat,
            :ne_longitude => ne_long,
            :sort => 2)

    request2 = BoundingBox.new(
            :term => keyword,
            :sw_latitude => sw_lat,
            :sw_longitude => sw_long,
            :ne_latitude => ne_lat,
            :ne_longitude => ne_long,
            :sort => 2,
            :limit => 20,
            :offset => 20)


    [ client.search(request), client.search(request2) ]
  end

  def save_to(location)

  end
end
