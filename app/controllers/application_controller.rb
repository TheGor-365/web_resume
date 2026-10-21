class ApplicationController < ActionController::Base
  around_action :with_locale

  def default_url_options
    super.merge(locale: I18n.locale)
  end

  private

  def with_locale(&action)
    requested = params[:locale].to_s
    locale = %w[ru en].include?(requested) ? requested : "ru"
    I18n.with_locale(locale, &action)
  end
end
