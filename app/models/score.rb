class Score < ActiveRecord::Base
  belongs_to :place
  belongs_to :package
end
