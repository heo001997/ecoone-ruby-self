class SurveysController < ApplicationController
  def index
    result = Survey::Operation::List.({
        params: params,
        model_class: Survey,
        id_addtribute: :survey_id,
        request: request
    })
    super(result, Survey::Representer::Short)
  end

  def show
    result = Survey::Operation::Show.({
        params: params,
        model_class: Survey,
        id_attribute: :survey_id,
        request: request
    })
    super(result, Survey::Representer::Full)
  end

  def create
    result = Survey::Operation::Create.({
        params: params,
        model_class: Survey,
        id_attribute: :survey_id,
        request: request
    })
    super(result, Survey::Representer::Short)
  end
end