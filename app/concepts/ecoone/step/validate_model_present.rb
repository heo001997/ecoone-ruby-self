class Ecoone::Step::ValidateModelPresent
  extend Uber::Callable

  def self.call(options, model:, **)
    return model.present?
  end
end