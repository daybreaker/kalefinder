task :grid_search, [:scraper_class, :keywords] => [:environment] do |t, args|
  ne = [29.991376, -90.027274]
  sw = [29.914481, -90.139884]

  vert_inc = (ne[0]-sw[0])/1#5
  horz_inc = (ne[1]-sw[1])/1#4

  ( sw[0]..( ne[0] - vert_inc ) ).step(vert_inc) do |sw_lat|
    (sw[1]..(ne[1]-horz_inc)).step(horz_inc) do |sw_long|
      args[:keywords].split(" ").each do |keyword|
        puts " ------ "
        puts keyword
        yelp = YelpScraper.new(
          :sw_lat => sw_lat,
          :sw_long => sw_long,
          :ne_lat => sw_lat + vert_inc,
          :ne_long => sw_long + horz_inc,
          :keyword => keyword
        )
        puts yelp.scrape.inspect
      end
    end
  end

  puts args[:scraper_class].inspect
  puts args[:keywords].inspect
end

