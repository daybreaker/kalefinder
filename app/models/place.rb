class Place < ActiveRecord::Base
  has_many :scores
  has_many :packages, through: :scores

  serialize :categories, Array

  def self.for_package(package)
    Place.order("package_#{package.id}" => :desc)
  end

  def score(package)
    scores.where(package_id: package.id).first.value
  end

end
