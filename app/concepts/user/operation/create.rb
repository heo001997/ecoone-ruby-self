class User::Operation::Create < BaseOperation
  step Model(User, :create)
  #step Subprocess ( Ecoone::Operation::FindManyWithPagination )
  fail Ecoone::Step::ModelNotFound
end