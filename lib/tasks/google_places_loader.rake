namespace :google_places_loader do
  task :load, [:key, :output] => :environment do |t, args|
    key = args[:key]
    output_location = args[:output]

    puts key
    puts output_location

    GooglePlaces::Loader.new(key, output_location).run
  end
end
