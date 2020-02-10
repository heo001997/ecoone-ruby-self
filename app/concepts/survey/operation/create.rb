class Survey::Operation::Create < BaseOperation
  step Model(Survey, :new)
  step Contract::Build( constant: Survey::Contract::Create )
  step Contract::Validate()
  step Contract::Persist()

end