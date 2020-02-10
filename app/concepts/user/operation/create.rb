class User::Operation::Create < BaseOperation
  step Model(User, :new)
  step Contract::Build( constant: User::Contract::Create )
  step Contract::Validate()
  step Contract::Persist()
  #fail Ecoone::Step::ModelNotFound
end