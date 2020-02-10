require 'roar/decorator'
require 'roar/json'

class Survey::Representer::Short < Roar::Decorator
  include Roar::JSON

  property :title
  property :description
  property :image # What happend when it's null, can we add some default to know it's null not just clean this null field in result?
end
