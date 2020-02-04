#This representer is used for displaying a single result
require 'roar/decorator'
require 'roar/json'

class Ecoone::Representer::Entity
  attr_reader :model

  def initialize(model, result)
    @model = model
    @result = result
  end

  # Add more default JSON specification here
  def as_json
    page          = @result[:pagination_page] || 1
    total_pages   = @result[:pagination_total_pages] || 1
    per_page      = @result[:pagination_per_page] || 1
    {
        current_page: page,
        total_pages: total_page,
        per_page: per_page,
        data: @model
    }
  end
end