module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Kalefinder"      
    end
  end
end
