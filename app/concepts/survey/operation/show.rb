class Survey::Operation::Show < AuthenticatedOperation
  step Model(Survey, :find_by, :survey_id)
  step Policy::Pundit( Survey::Policy::Policy, :show? )
  fail Ecoone::Step::ModelNotFound
end