class ApplicationController < ActionController::Base

  #require 'bitly'

  protect_from_forgery
  before_filter :set_locale, :prepare_for_mobile
#o_7t70lsdg3b
#R_8006c2ec01704d851dd9bea665ce9f3b
  def expires_now #:doc:
    response.cache_control.replace(:no_cache => true)
  end
  def set_locale
    I18n.locale = :ar
    #params[:locale].blank? ? cookies[:last_seen_locale] : (cookies[:last_seen_locale] = params[:locale])
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
