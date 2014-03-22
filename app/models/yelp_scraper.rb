class YelpScraper
  include Yelp::V2::Search::Request
  attr_accessor :lat, :long, :city, :keyword, :client

  def initialize(lat: 29.9667, long: -90.0500, city:"New Orleans", keyword: nil)
    @lat = lat
    @long = long
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
    request = Location.new(
              :term => keyword,
              :city => city)
    client.search(request)
  end

  def save_to(location)

  end
end
