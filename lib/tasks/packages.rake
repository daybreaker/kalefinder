task :create_packages_and_scores => :environment do
  party_time = Package.create(name: 'Party time!', description: 'Cheap booze, live music, and cheap food.')
  party_time_rule = { 'dive_bar' => 5, 'live_music' => 4, 'cheap_food' => 3 }
  potential = party_time_rule.values.sum

  Place.all.each do |place|
    score = 0.0

    party_time_rule.each do |key, value|
      score += value if place.categories.include? key
    end

    puts score / potential
    place.scores.create(package: party_time, value: score / potential)
  end
end
