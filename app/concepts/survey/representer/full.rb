require 'roar/json'
require 'roar/decorator'

class Survey::Representer::Full < Survey::Representer::Short
  include Roar::JSON

  property :survey_id
  property :from_date
  property :to_date
  property :status
  property :created_by
  property :created_date
  property :updated_by
  property :updated_date
end