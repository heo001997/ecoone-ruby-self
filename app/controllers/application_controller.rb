class ApplicationController < ActionController::API
  def index(result, representer)
    params = get_params(result, representer)

    ### Still lack of codes
  end

  private

  def get_params(result, representer)
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
