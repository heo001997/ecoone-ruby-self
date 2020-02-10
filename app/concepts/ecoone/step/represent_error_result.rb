class Ecoone::Step::RepresentErrorResult
  extend Uber::Callable

  def self.call(options, representer:, params:, **)
    # Wrap in API specification
    options[:model] = Ecoone::Representer::Entity.new(params[:errors], params).as_json
    true
  end
end