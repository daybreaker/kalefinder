class PackagesController < ApplicationController
  def new
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
    @places = Place.all
  end
end
