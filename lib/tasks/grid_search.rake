task :grid_search => :environment do |t|
  ne = [29.991376, -90.027274]
  sw = [29.914481, -90.139884]
  
  keywords = %w(fine_dining cajun_food creole_food restaurants cockatils dive_bar live_music night_club shopping cafe museum coffee haunted fancy_places)
  places = {}
  vert_inc = (ne[0]-sw[0])/5
  horz_inc = (ne[1]-sw[1])/4

  output = Rails.root.to_s + "/public/yelp.json"
  
  keywords.each do |keyword|
    keyword.gsub!("_"," ")
    puts keyword

    ( sw[0]..( ne[0] - vert_inc ) ).step(vert_inc) do |sw_lat|
      ( sw[1]..( ne[1] - horz_inc ) ).step(horz_inc) do |sw_long|
        yelp = YelpScraper.new(
          :sw_lat => sw_lat,
          :sw_long => sw_long,
          :ne_lat => sw_lat + vert_inc,
          :ne_long => sw_long + horz_inc,
          :keyword => keyword
        )
        puts "Bounding box - SW Corner: [#{sw_lat}, #{sw_long}], NE Corner: [#{sw_lat + vert_inc},  #{sw_long + horz_inc}]"
        res1, res2 = yelp.scrape
        places[keyword] ||= []
        places[keyword] += ( res1["businesses"] + res2["businesses"] )
      end
    end
  end

  puts "Writing output to #{output}."
  File.open(output, 'w') { |f| f.write JSON.pretty_generate(places) }
end

