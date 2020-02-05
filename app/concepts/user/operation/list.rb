class User::Operation::List < AuthenticatedOperation
  step Policy::Pundit( User::Policy::Policy, :list?)
  step Subprocess ( Ecoone::Operation::FindManyWithPagination )
  fail Ecoone::Step::ModelNotFound
end