class Place < ActiveRecord::Base
  CATEGORIES = %w(fine_dining cajun_food creole_food cheap_food food cocktail_bar bar dive_bar live_music night_club shopping cafe zoo aquarium museum)
  has_many :scores, dependent: :destroy
  has_many :packages, through: :scores

  serialize :categories, Array

  def score(package)
    val = scores.where(package_id: package.id).first.value * 20
    val
  end

end
