class Survey::Policy::Policy
  def initialize(current_survey, model)
    @current_survey, @model = current_survey, model
  end

  def list?
    #return @current_survey.is_admin?
     return @current_user == @model
  end

  def show?
    #return true if @current_survey.is_admin?
    return @current_user == @model
  end
end