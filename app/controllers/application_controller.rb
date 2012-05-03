class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale].blank? ? cookies[:last_seen_locale] : (cookies[:last_seen_locale] = params[:locale])
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

end
