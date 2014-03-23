task :create_packages_and_scores => :environment do
  party_time = Package.where(name: 'Party time!', description: 'Cheap booze, live music, and cheap food.').first_or_create
  party_time_rule = { 'dive_bar' => 6, 'live_music' => 6, 'cheap_food' => 1 }
  party_time_potential = party_time_rule.values.sum

  classy = Package.where(name: 'Seersucker Special', description: 'Fine Dining and Cocktails').first_or_create
  classy_rule = { 'cocktail' => 6, 'fine_dining' => 6 }
  classy_potential = classy_rule.values.sum

  family_fun = Package.where(name: 'Family Fun', description: 'Zoos, Aquariums, Museums, and Reasonably priced food.').first_or_create
  family_fun_rule = { 'zoo' => 5, 'museum' => 5, 'aquarium' => 5, 'cheap_food' => 2 }
  family_fun_potential = family_fun_rule.values.sum

  Score.delete_all

  Place.all.each do |place|
    party_time_score = 0.0

    party_time_rule.each do |key, value|
      party_time_score += value if place.categories.include? key
    end

    place.scores.create(package: party_time, value: party_time_score / party_time_potential)

    classy_score = 0.0

    classy_rule.each do |key, value|
      classy_score += value if place.categories.include? key
    end

    place.scores.create(package: classy, value: classy_score / classy_potential)

    family_fun_score = 0.0

    family_fun_rule.each do |key, value|
      family_fun_score += value if place.categories.include? key
    end

    place.scores.create(package: family_fun, value: family_fun_score / family_fun_potential)
  end
end
