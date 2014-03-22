class PackagesController < ApplicationController
  def new
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
    package_id = "package_#{params[:id]}"
    @places = Place.order(package_id => :desc)
  end
end
