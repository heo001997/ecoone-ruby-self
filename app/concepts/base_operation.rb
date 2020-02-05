class BaseOperation < Trailblazer::Operation
  pass :initialize_errors

  def initialize_errors(options, **)
    if !options[:errors]
      options[:errors] = Array.new
    end
  end
end