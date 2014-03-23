class Package < ActiveRecord::Base
  has_many :scores, dependent: :delete_all
  has_many :places, through: :scores

  def html_class
    name.parameterize
  end
end
