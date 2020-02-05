class Ecoone::Step::RepresentResult
  extend Uber::Callable

  def self.call(options, model:, representer:, params:, **)
    options[:model] = representer.new(model).as_json
    # Wrap in API specification
    options[:model] = Ecoone::Representer::Entity.new(options[:model], params).as_json
  end
end