module GooglePlaces
  class Loader
    attr_accessor :key, :output


    def initialize(key, output)
      @key = key
      @output = output
    end

    # can clean this up later
    def searches
      {
        fine_dining: GooglePlaces::RadarSearch.new(types: %w{food restraunt},
                                                   keyword: 'fine dining',
                                                   minprice: 3,
                                                   key: key),

        cajun_food: GooglePlaces::RadarSearch.new(types: %w{food restraunt},
                                                  keyword: 'cajun food',
                                                  key: key),

        creole_food: GooglePlaces::RadarSearch.new(types: %w{food restraunt},
                                                  keyword: 'creole food',
                                                  key: key),

        cheap_food: GooglePlaces::RadarSearch.new(types: %w{food restraunt},
                                                  maxprice: 2,
                                                  key: key),

        food: GooglePlaces::RadarSearch.new(types: %w{food restraunt},
                                            key: key),

        cocktail_bar: GooglePlaces::RadarSearch.new(types: %w{bar},
                                                    keyword: 'cocktails',
                                                    minprice: 3,
                                                    key: key),

        bar: GooglePlaces::RadarSearch.new(types: %w{bar},
                                           key: key),

        dive_bar: GooglePlaces::RadarSearch.new(types: %w{bar},
                                                keyword: 'dive bar',
                                                maxprice: 2,
                                                key: key),

        live_music: GooglePlaces::RadarSearch.new(types: %w{bar night_club},
                                                  keyword: 'live music',
                                                  key: key),

        night_club: GooglePlaces::RadarSearch.new(types: %w{night_club},
                                                  key: key),

        shopping: GooglePlaces::RadarSearch.new(types: %w{department_store clothing_store shopping_mall jewelry_store shoe_store},
                                                keyword: 'shopping',
                                                key: key),

        cafe: GooglePlaces::RadarSearch.new(types: %w{cafe},
                                            key: key),

        zoo: GooglePlaces::RadarSearch.new(types: %w{zoo},
                                           key: key),

        aquarium: GooglePlaces::RadarSearch.new(types: %w{aquarium},
                                                key: key),

        museum: GooglePlaces::RadarSearch.new(types: %w{museum},
                                              key: key),

      }
    end

    def run_searches
      results = {}

      searches.each do |key, search|
        puts "Searching for #{key}"
        results[key] = search.search
      end

      results
    end

    def transpose_results(search_results)
      puts 'Transposing radar search results.'
      results = []

      search_results.each do |key, radar_results|
        radar_results.each do |radar_result|
          print '.'
          place = results.select { |p| p['id'] == radar_result['id'] || p['reference'] == radar_result['reference'] }.first

          if place
            place['catagories'] << key
          else
            results << { 'id' => radar_result['id'], 'reference' => radar_result['reference'], 'catagories' => [ key ] }
          end
        end
      end

      puts

      results
    end

    def populate_details(places)
      puts 'Populating details.'

      results = []
      places.each do |place|
        print '.'

        result = GooglePlaces::DetailsSearch.new(key: key, reference: place['reference']).search
        result['catagories'] = place['catagories']
        result.delete('reviews') # we dont need this right now, just taking up space
        result.delete('adr_address')
        results << result
      end

      puts

      results
    end

    def run
      places = populate_details transpose_results(run_searches)

      puts "Writing output to #{output}."
      File.open(output, 'w') { |f| f.write JSON.dump(places) }
    end
  end
end
