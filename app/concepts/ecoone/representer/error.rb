# High level representer for all error
require "roar/decorator"
require "roar/json"

class Ecoone::Representer::Error
  attr_reader :model

  def initialize(model)
    @model = model
  end

  def as_json
    model
  end
end