class Ecoone::Step::RepresentListResult
  extend Uber::Callable

  def self.call(options, model:, representer:, params:, **)
    options[:model] = representer.for_collection.new(model).as_json
    # Wrap in API specification
    options[:model] = Ecoone::Representer::Entity.new(options[:model], params).as_json
    true
  end
end