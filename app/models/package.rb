class Package < ActiveRecord::Base
  has_many :scores
  has_many :places, through: :scores
end
