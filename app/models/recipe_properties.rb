require 'active_record/attribute_methods/crate_object'
class RecipeProperties
  PROPERTIES = [:preparation_time, :rest_time, :calories, :difficulty]
  attr_accessor *PROPERTIES

  include CrateObject

  def initialize(opts = {})
    @preparation_time = opts[:preparation_time]
    @rest_time = opts[:rest_time]
    @calories = opts[:calories]
    @difficulty = opts[:difficulty]
  end

  # Pretty print
  def to_s
    str = ""
    PROPERTIES.each do |property|
      str << "#{property.to_s.humanize}: #{send(property)}\n"
    end
    str
  end

end