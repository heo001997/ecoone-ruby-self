class Ecoone::Step::ModelNotFound
  extend Uber::Callable # WTF is this Uber? Grab

  def self.call(options, params, **)
    # Validate model class is set
    if !options[:model_class]
      raise Exception.new("Variable model_class must be present")
    end
    id_attribute          = options[:id_attribute]
    id                    = params[id_attribute]
    model_class           = options[:model_class].to_s.downcase
    options[:representer] = Ecoone::Representer::Error
    options[:error]       = {
                                "code": "record.not_found",
                                "message": "A #{model_class} could not be found with ID #{id}"
                            }
    options["http_status"] = HttpStatus::NOT_FOUND
  end
end