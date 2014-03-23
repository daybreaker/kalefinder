namespace :loaders do
  task :load_google_json, [:file] => :environment do |t, args|
    puts args[:file]

    json_file = JSON.load(open(args[:file]))

    puts json_file.length

    json_file.each do |place_json|
      data = {
        lat: place_json['geometry']['location']['lat'],
        long: place_json['geometry']['location']['lng'],
        short_name: place_json['name'],
        address: place_json['formatted_address'],
        categories: place_json['catagories']
      }

      Place.create!(data)
    end
  end

  task :load_yelp_json => :environment do |t|
    json_file = JSON.parse(IO.read(Rails.root.to_s + "/public/yelp.json"))
    puts json_file.length
    
    json_file.each do |category, places|
      puts category
      puts places.length
      puts places.first.inspect
    end
  end
end
