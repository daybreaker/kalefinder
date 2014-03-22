class Place < ActiveRecord::Base

  def self.for_package(package)
    Place.order("package_#{package.id}" => :desc)
  end

  def score(package)
    send("package_#{package.id}")
  end

end
