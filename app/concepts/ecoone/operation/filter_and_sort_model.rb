# Calling this operation will automatically sort and filter the :model attribute
# if there is any of the required parameters.
# To sort include :sort_by and :sort_order
# To filter include :filters with format ["user_id[gte]=1","first_name[eql]=rasmus"]
class Ecoone::Operation::FilterAndSortModel < BaseOperation
  #FilterSignal = Class.new(Trailblazer::Activity::Signal)
  #SortSignal   = Class.new(Trailblazer::Activity::Signal)
  #
  #step :validate_should_continue, Output(:failure) => End(:success) # If return :failure then go to (End success) <<< so what is End Success
  ## Filter first and then sort
  #step :assert_should_filter, Output(FilterSignal, :filter) => Track(:filter)
  #step Subprocess( Filter::Operation::Filter ),
  #     Trailblazer::Activity.Output(Trailblazer::Activity::Left, :failure) => Trailblazer::Activity::DSL::Linear.Track(:failure),
  #     magnetic_to: :filter
  #step :assert_should_sort, Output(SortSignal, :sort) => Track(:sort)
  #step Subprocess( Sort::Operation::Sort ),
  #     Trailblazer::Activity.Output(Trailblazer::Activity::Left, :failure) => Trailblazer::Activity::DSL::Linear.Track(:failure),
  #     magnetic_to: :sort
  #
  ## Skip whole operation if no sort or filter params are set
  #def validate_should_continue(options, params:, **)
  #  return Railway.fail! if !params[:sort_by] && !params[:sort_order] && !params[:filters]
  #  Railway.pass!
  #end
  #
  #def assert_should_filter(options, params:, **)
  #  return FilterSignal if params[:filters]
  #  Railway.pass!
  #end
  #
  #def assert_should_sort(options, params:, **)
  #  return SortSignal if params[:sort_by] && params[:sort_order]
  #  # Continue execution if we shouldn't sort
  #  Railway.pass!
  #end
end
