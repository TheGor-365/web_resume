class ApplicationController < ActionController::Base
  around_action :use_requested_locale

  private

  def use_requested_locale(&action)
    locale = params[:locale].to_s
    locale = I18n.default_locale.to_s unless I18n.available_locales.map(&:to_s).include?(locale)
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    super.merge(locale: I18n.locale)
  end
end
