class ApplicationController < ActionController::API
  def index(result, representer)
    params = get_params(result, representer)
    result = Ecoone::Operation::HandleResult.(params)

    # Render return output to user
    render(json: result[:model], status: result[:http_status]) # Please care about ":" character
  end

  def show(result, representer)
    params = get_params(result, representer)
    result = Ecoone::Operation::HandleResult.(params)

    # Render output to user
    render(json: result[:model], status: result[:http_status])
  end

  def create(result, representer)

  end

  private def get_params(result, representer)
    params = {
        params: result,
        model: result[:model],
        http_status: result[:http_status],
        representer: representer
    }
    params[:model] if result[:model]
    params[:error] if result[:error]
    params
  end
end
