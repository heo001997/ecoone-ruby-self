class User::Policy::Policy
  def initialize(current_user, model)
    @current_user, @model = current_user, model
  end

  def list?
    return @current_user.is_admin?
  end

  def show?
    return true if @current_user.is_admin?
    return @current_user == @model
  end
end