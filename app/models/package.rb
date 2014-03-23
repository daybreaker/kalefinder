class Package < ActiveRecord::Base
  has_many :scores, dependent: :destroy
  has_many :places, through: :scores
end
