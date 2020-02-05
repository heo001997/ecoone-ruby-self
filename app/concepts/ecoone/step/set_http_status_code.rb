class Ecoone::Step::SetHttpStatusCode
  extend Uber::Callable

  def self.call(options, params:, **)
    options[:http_status] = HttpStatus::SUCCESS if !options[:http_status]
  end
end