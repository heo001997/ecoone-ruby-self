class AuthenticatedOperation < BaseOperation
  step Subprocess( Ecoone::Operation::Authenticate ), Output(:fail_fast) => End(:unauthorized) #WTF is that????? fail_fast
end