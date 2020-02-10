class Survey::Operation::List < AuthenticatedOperation
  step Policy::Pundit( Survey::Policy::Policy, :list? )
  step Subprocess ( Ecoone::Operation::FindManyWithPagination )
  fail Ecoone::Step::ModelNotFound
end