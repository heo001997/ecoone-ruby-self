class Ecoone::Operation::HandleResult < Trailblazer::Operation
  ListSignal = Class.new(Trailblazer::Activity::Signal)
  ShowSignal = Class.new(Trailblazer::Activity::Signal)

  step Ecoone::Step::ValidateModelPresent
  step :assert_railway_direction, Output(ListSignal, :list) => Track(:list),
                                  Output(ShowSignal, :show) => Track(:show)
  step Ecoone::Step::RepresentListResult, magnetic_to: :list
  step Ecoone::Step::RepresentResult, magnetic_to: :show

  # Assume operation is on fail path for error result
  fail Ecoone::Step::RepresentErrorResult, magnetic_to: :error
  pass Ecoone::Step::SetHttpStatusCode

  # Route to correct representer step
  def assert_railway_direction(options, params:, **)
    if options[:error] && !options[:error].empty?
      return Railway.fail!
    elsif options[:model].is_a?(ActiveRecord::Relation)
      return ListSignal
    else
      return ShowSignal
    end
  end
end