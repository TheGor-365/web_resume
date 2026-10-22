class ApplicationController < ActionController::Base
  # Request-scoped locale to prevent Puma thread leakage.
  around_action :with_request_locale

  # Preserve legacy Russian paths; propagate non-default locale in Turbo links.
  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { locale: I18n.locale }
  end

  private

  def with_request_locale(&action)
    locale = params[:locale].presence || I18n.default_locale
    unless I18n.available_locales.map(&:to_s).include?(locale.to_s)
      raise ActionController::RoutingError, "Unsupported locale"
    end

    I18n.with_locale(locale, &action)
  end
end
