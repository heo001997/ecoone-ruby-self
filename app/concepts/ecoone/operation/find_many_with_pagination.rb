class Ecoone::Operation::FindManyWithPagination < BaseOperation
  pass :validate_page
  pass :set_pagination_params
  step :find_paginated
  step Subprocess( Ecoone::Operation::FilterAndSortModel)
  pass :set_total_pages
  fail Ecoone::Step::ModelNotFound

  def validate_page(options, params:, **)
    params[:page] = params[:page].to_i
    if !params[:page] || params[:page] < 1
      params[:page] = 1
    end
  end

  def set_pagination_params(options, params:, **)
    options[:pagination_page] = params[:page]
    options[:pagination_per_page] = 25
  end

  def find_paginated(options, params:, model_class:, **)
    options[:model] = model_class.paginate({
                                               page: options[:pagination_page],
                                               per_page: options[:pagination_per_page]
                                           })
    Railway.pass!
  end

  def set_total_pages(options, model:, **)
    options[:pagination_total_pages] = options[:model].total_pages
  end
end