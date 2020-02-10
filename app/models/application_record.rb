class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Override default created_at and updated_at to use legacy database approach
  class << self
    private

    def timestamp_attributes_for_update
      super << 'updated_date'
    end

    def timestamp_attributes_for_create
      super << 'created_date'
    end
  end
end
