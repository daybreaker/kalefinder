class PackagesController < ApplicationController
  def new
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
    @places =  Score.where(package_id: @package.id).where('value > ?', 0.0).order('value DESC').flat_map(&:place)
  end
end
