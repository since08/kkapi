class BaseApplicationController < ActionController::API
  # 使用了gem wechat，会导致Render失效，需增加以下代码来fix
  # 问题讨论见 https://github.com/Eric-Guo/wechat/issues/165
  include ActionView::Rendering
  def render_to_body(options)
    _render_to_body_with_renderer(options) || super
  end

  include RequestParamsInspector
  class CommonError < StandardError; end
  class AuthorizedError < StandardError; end

  rescue_from(CommonError) do |err|
    render_api_error(err)
  end

  rescue_from(AuthorizedError) do |err|
    render json: { error: 'Unauthorized', message: err }, status: :unauthorized
  end

  rescue_from(ActiveRecord::RecordNotFound) do
    render json: { error: 'Not Found', message: I18n.t('errors.record_not_found') }, status: :not_found
  end

  rescue_from(ActiveRecord::RecordInvalid) do
    render json: { error: 'RecordInvalid', message: I18n.t('errors.record_invalid') }, status: :bad_request
  end

  def render_api_error(msg, code = 1)
    render 'common/basic', locals: { api_result: ApiResult.error_result(msg, code) }
  end

  def render_api_success
    render 'common/basic', locals: { api_result: ApiResult.success_result }
  end

  def raise_error(msg, i18n = true)
    msg = i18n ? I18n.t("errors.#{msg}") : msg
    raise CommonError, msg
  end
end
